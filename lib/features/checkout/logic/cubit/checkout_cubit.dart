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

    CheckoutCubit(this.checkoutRepo, this.orderHistoryCubit, this.cartCubit)
      : super(const CheckoutState.initial());

    final formKeyShipping = GlobalKey<FormState>();
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController streetAddressController = TextEditingController();
    final TextEditingController? postalCodeController = TextEditingController();

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

    void onSaveShippingInfo() {
      if (!formKeyShipping.currentState!.validate() ||
          totalOrder == null ||
          totalOrder! < 0 ||
          ordersList.isEmpty) {
        return;
      }
      formKeyShipping.currentState!.save();

      emit(const CheckoutState.successShipping());
    }

    void onPaymentContinue() {
      if (!formKeyPayment.currentState!.validate() ||
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

    Future<void> saveOrder() async {
      if (totalOrder == null || totalOrder == null || ordersList.isEmpty) {
        return;
      }

      final OrderModel orderModel = OrderModel(
        orderAt: DateTime.now(),
        totalPrice: totalOrder!,
        totalQuantity: totalQuantity,
        items: ordersList,
      );
      await checkoutRepo.saveOrder(orderModel: orderModel);
      orderHistoryCubit.addNewOrder(orderModel: orderModel);

      if (isOrderFromCart) {
        cartCubit.clearCart();
      }

      emit(const CheckoutState.successReview());
    }

    void resetState() {
      emit(const CheckoutState.initial());
    }

    @override
    Future<void> close() {
      isOrderFromCart = true;
      fullNameController.dispose();
      streetAddressController.dispose();
      postalCodeController?.dispose();

      cardHolderNameController.dispose();
      cardNumberController.dispose();
      expirationController.dispose();
      cvvController.dispose();

      return super.close();
    }
  }
