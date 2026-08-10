import 'dart:convert';

import 'package:ecommerce_app/core/storage/hive_service.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';

class WishlistRepo {
  final HiveService hiveService;
  const WishlistRepo(this.hiveService);

  Future<bool> toggleFavoriteProduct({
    required ProductModel productModel,
  }) async {
    final key = productModel.id.toString();
    final bool wasAdded;

    if (hiveService.containsKey(key: key)) {
      await hiveService.removeItem(key: key);
      wasAdded = false;
    } else {
      final jsonString = json.encode(productModel.toJson());
      await hiveService.saveItem(key: key, jsonValue: jsonString);
      wasAdded = true;
    }

    return wasAdded;
  }

  List<ProductModel> getCachedWishList() {
    final all = hiveService.getAll();

    return all.values
        .map((jsonString) => ProductModel.fromJson(json.decode(jsonString)))
        .toList();
  }

  Future<void> removeFromWishlist({required int productId}) async {
    await hiveService.removeItem(key: productId.toString());
  }

  Future<void> clearAllFavorite() async => await hiveService.clear();
}