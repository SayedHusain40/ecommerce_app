import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/features/categories/data/model/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;


  // Category
  const factory CategoryState.getCategoryLoading() = GetCategoryLoading;
  const factory CategoryState.getCategorySuccess(
    final List<CategoryModel> categoriesList,
  ) = GetCategorySuccess;
  const factory CategoryState.getCategoryFailure(AppFailure appFailure) =
      GetCategoryFailure;
}
