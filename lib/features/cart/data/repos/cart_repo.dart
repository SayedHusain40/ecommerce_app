import 'dart:convert';

import 'package:ecommerce_app/core/storage/hive_box_names.dart';
import 'package:ecommerce_app/core/storage/hive_service.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

//TODO i want save idea of this repo some time no need do all thing
// like here cubit do it for us

class CartRepo {
  final HiveService hiveService;
  final FirebaseAuth firebaseAuth;

  CartRepo(this.hiveService, this.firebaseAuth);

  String get _boxName {
    final uid = firebaseAuth.currentUser!.uid;
    return HiveBoxNames.cart(uid);
  }

  Map<int, CartItemModel> getCachedCartList() {
    final resultAsMap = hiveService.getAll<int>(_boxName);

    final items =
        resultAsMap.values
            .toList()
            .map((e) => CartItemModel.fromJson(json.decode(e)))
            .toList()
          ..sort((a, b) => b.addedAt.compareTo(a.addedAt));

    return {for (final item in items) item.product.id: item};
  }

  Future<void> updateOrAddToCart({required CartItemModel cartItemModel}) async {
    final int productId = cartItemModel.product.id;

    final jsonString = json.encode(cartItemModel.toJson());
    return await hiveService.saveItem(
      boxName: _boxName,
      key: productId,
      jsonValue: jsonString,
    );
  }

  Future<void> deleteProduct({required int productId}) {
    return hiveService.removeItem(boxName: _boxName, key: productId);
  }

  Future<void> clearCart() async {
    return await hiveService.clear(_boxName);
  }
}
