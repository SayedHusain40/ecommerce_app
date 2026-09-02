import 'dart:convert';

import 'package:ecommerce_app/core/storage/hive_box_names.dart';
import 'package:ecommerce_app/core/storage/hive_service.dart';
import 'package:ecommerce_app/features/address/data/models/address_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddressRepo {
  final HiveService hiveService;
  final FirebaseAuth firebaseAuth;

  AddressRepo(this.hiveService, this.firebaseAuth);

  String get _boxName {
    final uid = firebaseAuth.currentUser!.uid;
    return HiveBoxNames.address(uid); // add this to your HiveBoxNames
  }

  Map<int, AddressModel> getCachedAddresses() {
    final all = hiveService.getAll<int>(_boxName);

    return all.map(
      (key, jsonString) =>
          MapEntry(key, AddressModel.fromJson(json.decode(jsonString))),
    );
  }

  Future<int> addAddress({required AddressModel addressModel}) async {
    final jsonString = json.encode(addressModel.toJson());
    return await hiveService.addItem(boxName: _boxName, jsonValue: jsonString);
  }

  Future<void> saveAddress({
    required AddressModel addressModel,
    required int key,
  }) async {
    final jsonString = json.encode(addressModel.toJson());

    return await hiveService.saveItem(
      boxName: _boxName,
      key: key,
      jsonValue: jsonString,
    );
  }

  Future<void> addressKey({
    required int addressKey,
    required AddressModel updateAddress,
  }) async {
    final jsonString = json.encode(updateAddress.toJson());

    await hiveService.saveItem(
      boxName: _boxName,
      key: addressKey,
      jsonValue: jsonString,
    );
  }

  Future<void> removeAddress({required int addressKey}) async {
    await hiveService.removeItem(boxName: _boxName, key: addressKey);
  }
}
