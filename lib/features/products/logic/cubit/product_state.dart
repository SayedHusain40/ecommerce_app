import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;

  // for get all products
  const factory ProductState.getProductsLoading() = GetProductsLoading;
  const factory ProductState.getProductSuccess(
    final List<ProductModel> categoriesList,
  ) = GetProductsSuccess;
  const factory ProductState.getProductsFailure(AppFailure appFailure) =
      GetProductsFailure;

  // for get all products by category
  const factory ProductState.getProductByCategoryLoading() =
      GetProductsByCategoryLoading;
  const factory ProductState.getProductsByCategorySuccess(
    final List<ProductModel> categoriesList,
  ) = GetProductsByCategorySuccess;
  const factory ProductState.getProductsByCategoryFailure(
    AppFailure appFailure,
  ) = GetProductsByCategoryFailure;
}
