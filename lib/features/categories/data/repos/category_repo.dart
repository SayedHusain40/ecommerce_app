import 'package:ecommerce_app/core/errors/error_handler.dart';
import 'package:ecommerce_app/core/network/api/api_service.dart';
import 'package:ecommerce_app/core/result/app_result.dart';
import 'package:ecommerce_app/features/categories/data/model/category_model.dart';

class CategoryRepo {
  final ApiService apiService;

  CategoryRepo(this.apiService);

  Future<AppResult<List<CategoryModel>>> getCategories() async {
    try {
      final List<CategoryModel> response = await apiService.getCategories();

      return AppResult.success(response);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return AppResult.failure(failure);
    }
  }
}
