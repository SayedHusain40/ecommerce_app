import 'package:ecommerce_app/features/products/data/repos/product_repo.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;
  ProductCubit(this.productRepo) : super(const ProductState.initial());

  // Future<void> getProducts({int? limit}) async {
  //   emit(ProductState.loading());
  //   final result = await productRepo.getProducts(limit: limit);

  //   result.when(
  //     success: (data) {
  //       emit(ProductState.success(data));
  //     },
  //     failure: (appFailure) {
  //       emit(ProductState.failure(appFailure));
  //     },
  //   );
  // }
}
