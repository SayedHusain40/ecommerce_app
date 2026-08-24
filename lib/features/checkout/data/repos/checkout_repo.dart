import 'dart:convert';

import 'package:ecommerce_app/core/storage/hive_service.dart';
import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_app/features/checkout/data/models/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CheckoutRepo {
  final HiveService hiveService;
  final FirebaseAuth firebaseAuth;

  CheckoutRepo(this.hiveService, this.firebaseAuth);

  String get _boxName {
    final uid = firebaseAuth.currentUser!.uid;
    return 'order_$uid';
  }

  Future<int> saveOrder({required List<CartItemModel> orderList}) async {
    return await hiveService.addItem(
      boxName: _boxName,
      jsonValue: json.encode(orderList.map((e) => e.toJson()).toList()),
    );
  }

  List<OrderModel> getCachedOrderList() {
    final resultAsMap = hiveService.getAll(_boxName);
    final List<OrderModel> orders = [];

    for (final entry in resultAsMap.entries) {
      final decoded = json.decode(entry.value) as List;
      final items = decoded
          .map((item) => CartItemModel.fromJson(item))
          .toList();
      orders.add(OrderModel(orderId: entry.key, items: items));
    }

    return orders;
  }
}
