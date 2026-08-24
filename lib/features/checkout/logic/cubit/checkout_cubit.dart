import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_app/features/checkout/data/repos/checkout_repo.dart';
import 'package:ecommerce_app/features/checkout/logic/cubit/checkout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRepo checkoutRepo;

  CheckoutCubit(this.checkoutRepo) : super(const CheckoutState.initial());

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

    emit(const CheckoutState.successPayment());
  }

  Future<void> saveOrder() async {
    if (totalOrder == null || totalOrder! < 0 || ordersList.isEmpty) {
      return;
    }
    await checkoutRepo.saveOrder(orderList: ordersList);
    emit(const CheckoutState.successReview());
  }

  void resetState() {
    emit(const CheckoutState.initial());
  }

  @override
  Future<void> close() {
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
