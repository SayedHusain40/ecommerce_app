import 'dart:convert';

import 'package:ecommerce_app/core/storage/hive_box_names.dart';
import 'package:ecommerce_app/core/storage/hive_service.dart';
import 'package:ecommerce_app/features/checkout/data/models/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CheckoutRepo {
  final HiveService hiveService;
  final FirebaseAuth firebaseAuth;

  CheckoutRepo(this.hiveService, this.firebaseAuth);

  String get _boxName {
    final uid = firebaseAuth.currentUser!.uid;
    return HiveBoxNames.order(uid);
  }

  Future<int> saveOrder({required OrderModel orderModel}) async {
    return await hiveService.addItem(
      boxName: _boxName,
      jsonValue: json.encode(orderModel.toJson()),
    );
  }
}
