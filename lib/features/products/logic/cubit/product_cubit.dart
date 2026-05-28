import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:ecommerce_app/features/products/data/repos/product_repo.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;
  ProductCubit(this.productRepo) : super(ProductState.initial());

  Future<void> getProducts() async {
    emit(ProductState.getProductsLoading());
    final result = await productRepo.getProducts();

    result.when(
      success: (data) {
        emit(ProductState.getProductSuccess(data));
      },
      failure: (appFailure) {
        emit(ProductState.getProductsFailure(appFailure));
      },
    );
  }

  Future<void> getProductsByCategory({required String category}) async {
    emit(ProductState.getProductByCategoryLoading());
    final result = await productRepo.getProductsByCategory(category: category);

    result.when(
      success: (data) {
        emit(ProductState.getProductsByCategorySuccess(data));
      },
      failure: (appFailure) {
        emit(ProductState.getProductsByCategoryFailure(appFailure));
      },
    );
  }
}
