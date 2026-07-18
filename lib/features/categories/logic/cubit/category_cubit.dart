import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:ecommerce_app/features/categories/data/repos/category_repo.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;
  CategoryCubit(this.categoryRepo) : super(const CategoryState.initial());

  Future<void> getCategories() async {
    // Guard: skip if already loaded or loading
    // final isAlreadyLoaded = state.maybeWhen(
    //   getCategorySuccess: (_) => true,
    //   getCategoryLoading: () => true,
    //   orElse: () => false,
    // );
    // if (isAlreadyLoaded) return;

    emit(const CategoryState.getCategoryLoading());
    final result = await categoryRepo.getCategories();

    result.when(
      success: (data) {
        emit(CategoryState.getCategorySuccess(data));
      },
      failure: (appFailure) {
        emit(CategoryState.getCategoryFailure(appFailure));
      },
    );
  }
}
