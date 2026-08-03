import 'dart:convert';

import 'package:ecommerce_app/core/storage/shared_preferences_service.dart';
import 'package:ecommerce_app/core/storage/storage_keys.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';

class WishlistRepo {
  final SharedPreferencesService sharedPreferencesService;
  const WishlistRepo(this.sharedPreferencesService);

  final key = StorageKeys.wishList;

  /// Returns `true` if it was added, `false` if it was removed.
  Future<bool> toggleFavoriteProduct({
    required ProductModel productModel,
  }) async {
    final List<ProductModel> cachedWishList = getCachedWishList();

    final exists = cachedWishList.any((e) => e.id == productModel.id);
    final bool wasAdded;

    if (exists) {
      cachedWishList.removeWhere((e) => e.id == productModel.id);
      wasAdded = false;
    } else {
      cachedWishList.add(productModel);
      wasAdded = true;
    }

    final jsonString = json.encode(
      cachedWishList.map((e) => e.toJson()).toList(),
    );
    await sharedPreferencesService.saveData(key: key, value: jsonString);

    return wasAdded;
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

  Future<bool> clearAllFavorite() =>
      sharedPreferencesService.removeData(key: key);
}
