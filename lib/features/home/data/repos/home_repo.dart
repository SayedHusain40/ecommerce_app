import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/core/network/api/api_service.dart';
import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo(this.apiService);

  Future<AppResult<List<ProductModel>>> getProducts() async {
    try {
      final ProductResponseModel response = await apiService.getProducts();

      final products =
          response.products?.whereType<ProductModel>().toList() ?? [];

      return AppResult.success(products);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return AppResult.failure(failure);
    }
  }
}
