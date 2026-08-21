import 'dart:convert';

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
    return 'cart_$uid';
  }

  List<CartItemModel> getCachedCartList() {
    final resultAsMap = hiveService.getAll(_boxName);

    return resultAsMap.values.map((e) {
      return CartItemModel.fromJson(json.decode(e));
    }).toList();
  }

  // here i don't do all works because cubit does and return final quantity
  // so just store it/ override it
  Future<void> updateOrAddToCart({required CartItemModel cartItemModel}) async {
    final String productId = cartItemModel.product.id.toString();

    final jsonString = json.encode(cartItemModel.toJson());
    return await hiveService.saveItem(
      boxName: _boxName,
      key: productId,
      jsonValue: jsonString,
    );
  }

  Future<void> deleteProduct({required int productId}) {
    return hiveService.removeItem(boxName: _boxName, key: productId.toString());
  }

  Future<void> clearCart() async {
    return await hiveService.clear(_boxName);
  }
}
