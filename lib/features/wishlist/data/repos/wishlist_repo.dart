import 'dart:convert';

import 'package:ecommerce_app/core/storage/hive_box_names.dart';
import 'package:ecommerce_app/core/storage/hive_service.dart';
import 'package:ecommerce_app/features/wishlist/data/models/wishlist_item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WishlistRepo {
  final HiveService hiveService;
  final FirebaseAuth firebaseAuth;
  const WishlistRepo(this.hiveService, this.firebaseAuth);

  String get _boxName {
    final uid = firebaseAuth.currentUser!.uid;
    return HiveBoxNames.wishlist(uid);
  }

  Map<int, WishlistItemModel> getCachedWishList() {
    final all = hiveService.getAll<int>(_boxName);

    final items =
        all.values
            .map(
              (jsonString) =>
                  WishlistItemModel.fromJson(json.decode(jsonString)),
            )
            .toList()
          ..sort((a, b) => b.addedAt.compareTo(a.addedAt)); // newest first

    return {for (final item in items) item.product.id: item};
  } 

  Future<void> toggleFavoriteProduct({
    required WishlistItemModel wishlistItemModel,
    required bool isFavorite,
  }) async {
    final int productId = wishlistItemModel.product.id;
    if (isFavorite) {
      // remove
      await removeFromWishlist(productId: productId);
    } else {
      // add
      await hiveService.saveItem(
        boxName: _boxName,
        key: productId,
        jsonValue: json.encode(wishlistItemModel.toJson()),
      );
    }
  }

  Future<void> removeFromWishlist({required int productId}) async {
    return await hiveService.removeItem(boxName: _boxName, key: productId);
  }

  Future<void> clearAllFavorite() async => await hiveService.clear(_boxName);
}
