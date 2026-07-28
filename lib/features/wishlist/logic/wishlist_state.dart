import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_state.freezed.dart';

@freezed
class WishlistState with _$WishlistState {
  const factory WishlistState.initial() = _Initial;
  const factory WishlistState.loading() = _Loading;
  const factory WishlistState.success(List<ProductModel> wishlist) = _Success;
  const factory WishlistState.failure(AppFailure appFailure) = _Failure;
}
