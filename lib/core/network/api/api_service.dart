import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api/api_constants.dart';
import 'package:ecommerce_app/features/categories/data/model/category_model.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET(ApiEndPoints.categories)
  Future<List<CategoryModel>> getCategories();

  @GET(ApiEndPoints.products)
  Future<ProductResponseModel> getProducts(
    @Query('limit') int? limit,
    @Query('sortBy') String? sortBy,
    @Query('order') String? order,
  );

  @GET(ApiEndPoints.productsByCategory)
  Future<ProductResponseModel> getProductsByCategory(
    @Path('category') String category,
    @Query('limit') int? limit,
    @Query('sortBy') String? sortBy,
    @Query('order') String? order,
  );

  @GET(ApiEndPoints.searchProducts)
  Future<ProductResponseModel> getProductsBySearchQuery(
    @Query('q') String query,
  );
}
