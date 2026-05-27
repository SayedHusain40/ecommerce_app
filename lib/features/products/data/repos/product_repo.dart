import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/core/network/api/api_service.dart';
import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';

class ProductRepo {
  final ApiService apiService;

  ProductRepo(this.apiService);

  Future<AppResult<List<ProductModel>>> getProducts() async {
    try {
      final ProductResponseModel response = await apiService.getProducts();

      // option 1

      // if products is null → use empty list []
      // keeps nullable items inside list
      final List<ProductModel> products = response.products;

      // option 2
      // Result type: List<ProductModel>
      // Converts list to non-nullable type.
      // BUT ⚠️ : If any item is actually null, app crashes at runtime.
      // final products = response.products?.cast<ProductModel>() ?? [];

      // option 3
      // Result type: List<ProductModel>
      // removes all null values
      // keeps only valid ProductModel
      // Example:  [product1, null, product2] => becomes: [product1, product2]
      // final products = response.products?.whereType<ProductModel>().toList() ?? [];

      return AppResult.success(products);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return AppResult.failure(failure);
    }
  }
}
