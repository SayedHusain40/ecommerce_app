import 'dart:convert';

import 'package:ecommerce_app/core/storage/hive_service.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WishlistRepo {
  final HiveService hiveService;
  final FirebaseAuth firebaseAuth;
  const WishlistRepo(this.hiveService, this.firebaseAuth);

  String get _boxName {
    final uid = firebaseAuth.currentUser!.uid;
    return 'wishlist_$uid';
  }

  Future<bool> toggleFavoriteProduct({
    required ProductModel productModel,
  }) async {
    final key = productModel.id.toString();
    final bool wasAdded;

    if (hiveService.containsKey(boxName: _boxName, key: key)) {
      await hiveService.removeItem(boxName: _boxName, key: key);
      wasAdded = false;
    } else {
      final jsonString = json.encode(productModel.toJson());
      await hiveService.saveItem(boxName: _boxName, key: key, jsonValue: jsonString);
      wasAdded = true;
    }

    return wasAdded;
  }

  List<ProductModel> getCachedWishList() {
    final all = hiveService.getAll(_boxName);

    return all.values
        .map((jsonString) => ProductModel.fromJson(json.decode(jsonString)))
        .toList();
  }

  Future<void> removeFromWishlist({required int productId}) async {
    await hiveService.removeItem(boxName: _boxName, key: productId.toString());
  }

  Future<void> clearAllFavorite() async => await hiveService.clear(_boxName);
}