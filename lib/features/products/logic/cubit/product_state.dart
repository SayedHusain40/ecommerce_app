import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;


  const factory ProductState.getProductLoading() = GetProductLoading;
  const factory ProductState.getProductSuccess(
    final List<ProductModel> categoriesList,
  ) = GetProductSuccess;
  const factory ProductState.getProductFailure(AppFailure appFailure) =
      GetProductFailure;
}
