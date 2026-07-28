import 'dart:convert';

import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/core/network/api/api_service.dart';
import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:ecommerce_app/core/storage/shared_preferences_service.dart';
import 'package:ecommerce_app/core/storage/storage_keys.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';

class ProductRepo {
  final ApiService apiService;
  final SharedPreferencesService sharedPreferencesService;
  ProductRepo(this.apiService, this.sharedPreferencesService);

  Future<AppResult<ProductModel>> getSpecificProduct({required int id}) async {
    try {
      final ProductModel response = await apiService.getSpecificProduct(id);

      final ProductModel product = response;

      return AppResult.success(product);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return AppResult.failure(failure);
    }
  }

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

  final keySearchHistory = StorageKeys.searchHistory;

  Future<bool> saveSearchProduct(
    ProductModel product, {
    int maxItems = 5,
  }) async {
    final history = getSearchHistory();

    history.removeWhere((p) => p.id == product.id);
    history.insert(0, product);

    if (history.length > maxItems) {
      history.removeRange(maxItems, history.length);
    }

    final jsonString = json.encode(history.map((p) => p.toJson()).toList());

    return sharedPreferencesService.saveData(
      key: keySearchHistory,
      value: jsonString,
    );
  }

  List<ProductModel> getSearchHistory() {
    final jsonString = sharedPreferencesService.getString(
      key: keySearchHistory,
    );
    if (jsonString == null || jsonString.isEmpty) return [];

    try {
      final List decoded = json.decode(jsonString);
      return decoded.map((e) => ProductModel.fromJson(e)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<bool> deleteSearchProduct({required int id}) async {
    final history = getSearchHistory();
    history.removeWhere((p) => p.id == id);

    final jsonString = json.encode(history.map((p) => p.toJson()).toList());

    return sharedPreferencesService.saveData(
      key: keySearchHistory,
      value: jsonString,
    );
  }
}
