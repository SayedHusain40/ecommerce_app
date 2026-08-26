import 'dart:convert';

import 'package:ecommerce_app/core/storage/hive_service.dart';
import 'package:ecommerce_app/features/checkout/data/models/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderHistoryRepo {
  final HiveService hiveService;
  final FirebaseAuth firebaseAuth;

  const OrderHistoryRepo(this.hiveService, this.firebaseAuth);

  String get _boxName {
    final userId = firebaseAuth.currentUser!.uid;
    return 'order_$userId';
  }

Future<List<OrderModel>> loadOrder() async {
  final result = hiveService.getAll(_boxName);

  final sortedKeys = result.keys.toList()..sort((a, b) => b - a); // newest first

  return sortedKeys
      .map((k) => OrderModel.fromJson(json.decode(result[k]!)))
      .toList();
}
}
