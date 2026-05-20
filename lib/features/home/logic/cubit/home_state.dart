import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/features/home/data/model/category_model.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;


  // Category
  const factory HomeState.getCategoryLoading() = GetCategoryLoading;
  const factory HomeState.getCategorySuccess(
    final List<CategoryModel> categoriesList,
  ) = GetCategorySuccess;
  const factory HomeState.getCategoryFailure(AppFailure appFailure) =
      GetCategoryFailure;

  // Product
  const factory HomeState.getProductLoading() = GetProductLoading;
  const factory HomeState.getProductSuccess(
    final List<ProductModel> categoriesList,
  ) = GetProductSuccess;
  const factory HomeState.getProductFailure(AppFailure appFailure) =
      GetProductFailure;
}
