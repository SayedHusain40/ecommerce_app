import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/core/network/api/api_service.dart';
import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';

class ProductRepo {
  final ApiService apiService;

  ProductRepo(this.apiService);

  Future<AppResult<List<ProductModel>>> getProducts({
    int? limit,
    String? sortBy,
    String? order,
  }) async {
    try {
      final ProductResponseModel response = await apiService.getProducts(
        limit,
        sortBy,
        order,
      );

      final List<ProductModel> products = response.products;

      return AppResult.success(products);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return AppResult.failure(failure);
    }
  }

  Future<AppResult<List<ProductModel>>> getProductsByCategory({
    required String categoryName,
    int? limit,
    String? sortBy,
    String? order,
  }) async {
    try {
      final ProductResponseModel response = await apiService
          .getProductsByCategory(categoryName, limit, sortBy, order);

      final List<ProductModel> products = response.products;

      return AppResult.success(products);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return AppResult.failure(failure);
    }
  }

  Future<AppResult<List<ProductModel>>> getProductsBySearchQuery({
    required String searchQuery,
  }) async {
    try {
      final ProductResponseModel response = await apiService
          .getProductsBySearchQuery(searchQuery);

      final List<ProductModel> products = response.products;

      return AppResult.success(products);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return AppResult.failure(failure);
    }
  }
}
