import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = ProductsLoading;
  const factory ProductState.success(List<ProductModel> products) =
      ProductsSuccess;
  const factory ProductState.failure(AppFailure appFailure) = ProductsFailure;
}
