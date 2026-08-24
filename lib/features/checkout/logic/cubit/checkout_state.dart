import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_state.freezed.dart';

@freezed
class CheckoutState with _$CheckoutState {
  
  const factory CheckoutState.initial() = _Initial;
  const factory CheckoutState.successShipping() = SuccessShipping;
  const factory CheckoutState.successPayment() = SuccessPayment;
  const factory CheckoutState.successReview() = SuccessReview;
}