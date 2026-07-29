import 'dart:convert';

import 'package:ecommerce_app/core/storage/shared_preferences_service.dart';
import 'package:ecommerce_app/core/storage/storage_keys.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';

class WishlistRepo {
  final SharedPreferencesService sharedPreferencesService;
  const WishlistRepo(this.sharedPreferencesService);

  final key = StorageKeys.wishList;

  Future<void> toggleFavoriteProduct({
    required ProductModel productModel,
  }) async {
    final List<ProductModel> cachedWishList = getCachedWishList();

    final exists = cachedWishList.any((e) => e.id == productModel.id);

    if (exists) {
      cachedWishList.removeWhere((e) => e.id == productModel.id);
    } else {
      cachedWishList.add(productModel);
    }

    final jsonString = json.encode(
      cachedWishList.map((e) => e.toJson()).toList(),
    );
    await sharedPreferencesService.saveData(key: key, value: jsonString);
  }

  List<ProductModel> getCachedWishList() {
    final jsonString = sharedPreferencesService.getString(key: key);
    if (jsonString == null || jsonString.isEmpty) return [];

    final List decoded = json.decode(jsonString);
    return decoded.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<void> removeFromWishlist({required int productId}) async {
    final cachedWishList = getCachedWishList();
    cachedWishList.removeWhere((e) => e.id == productId);

    final jsonString = json.encode(
      cachedWishList.map((e) => e.toJson()).toList(),
    );
    await sharedPreferencesService.saveData(key: key, value: jsonString);
  }

  bool isFavorite({required int productId}) {
    final cachedWishList = getCachedWishList();
    return cachedWishList.any((e) => e.id == productId);
  }

  int countFavorites() {
    return getCachedWishList().length;
  }

  Future<bool> clearAllFavorite() =>sharedPreferencesService.removeData(key: key);
}
