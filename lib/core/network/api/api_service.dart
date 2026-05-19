import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api/api_constants.dart';
import 'package:ecommerce_app/features/home/data/model/category_model.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET(ApiEndPoints.categories)
   Future<List<CategoryModel>> getCategories();

  @GET(ApiEndPoints.categories)
   Future<List<ProductModel>> getProducts();
} 