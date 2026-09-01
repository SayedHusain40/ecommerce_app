import 'package:ecommerce_app/core/storage/shared_preferences_service.dart';
import 'package:ecommerce_app/features/address/data/models/address_model.dart';
import 'package:ecommerce_app/features/address/logic/address_cubit.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/checkout/data/models/order_model.dart';
import 'package:ecommerce_app/features/checkout/data/repos/checkout_repo.dart';
import 'package:ecommerce_app/features/checkout/logic/cubit/checkout_state.dart';
import 'package:ecommerce_app/features/order_history/logic/cubit/order_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRepo checkoutRepo;
  final OrderHistoryCubit orderHistoryCubit;
  final CartCubit cartCubit;
  final AddressCubit addressCubit;
  final SharedPreferencesService sharedPreferencesService;

  CheckoutCubit(
    this.checkoutRepo,
    this.orderHistoryCubit,
    this.cartCubit,
    this.addressCubit,
    this.sharedPreferencesService,
  ) : super(const CheckoutState.initial());

  // final formKeyShipping = GlobalKey<FormState>();
  // final TextEditingController fullNameController = TextEditingController();
  // final TextEditingController streetAddressController = TextEditingController();
  // final TextEditingController? postalCodeController = TextEditingController();

  AddressModel? addressModel;

  final formKeyPayment = GlobalKey<FormState>();
  final TextEditingController cardHolderNameController =
      TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expirationController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  double? totalOrder;
  List<CartItemModel> ordersList = [];
  int totalQuantity = 0;
  bool isOrderFromCart = true;

  // step 1
  void onSaveShippingInfo({
    required AddressModel newAddressModel,
    bool saveAddress = false,
  }) async {
    if (totalOrder == null || totalOrder! < 0 || ordersList.isEmpty) {
      return;
    }

    addressModel = newAddressModel;

    if (saveAddress) {
      await addressCubit.addNewAddress(addressModel: addressModel!);
    }

    emit(const CheckoutState.successShipping());
  }

  // step 2
  void onPaymentContinue() {
    if (!formKeyPayment.currentState!.validate() ||
        addressModel == null ||
        totalOrder == null ||
        totalOrder! < 0 ||
        ordersList.isEmpty) {
      return;
    }
    formKeyPayment.currentState!.save();

    totalQuantity = ordersList.fold(
      0,
      (previousValue, e) => previousValue + e.quantity,
    );

    emit(const CheckoutState.successPayment());
  }

  // step 3
  Future<void> saveOrder() async {
    if (totalOrder == null ||
        addressModel == null ||
        totalOrder == null ||
        ordersList.isEmpty) {
      return;
    }

    final OrderModel orderModel = OrderModel(
      orderAt: DateTime.now(),
      totalPrice: totalOrder!,
      totalQuantity: totalQuantity,
      items: ordersList,
    );
    await checkoutRepo.saveOrder(orderModel: orderModel);

    if (isOrderFromCart) {
      cartCubit.clearCart();
    }

    clearCheckoutData();

    emit(const CheckoutState.successReview());
  }

  void resetState() {
    emit(const CheckoutState.initial());
  }

  void clearCheckoutData() {
    addressModel = null;
    totalOrder = null;
    ordersList = [];
    totalQuantity = 0;
    isOrderFromCart = true;

    cardHolderNameController.clear();
    cardNumberController.clear();
    expirationController.clear();
    cvvController.clear();

    formKeyPayment.currentState?.reset();
  }

  @override
  Future<void> close() {
    isOrderFromCart = true;

    cardHolderNameController.dispose();
    cardNumberController.dispose();
    expirationController.dispose();
    cvvController.dispose();

    return super.close();
  }
}
