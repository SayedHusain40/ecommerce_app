// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
  fullName: json['fullName'] as String,
  streetAddress: json['streetAddress'] as String,
  postalCode: json['postalCode'] as String?,
  addedAt: DateTime.parse(json['addedAt'] as String),
);

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'streetAddress': instance.streetAddress,
      'postalCode': instance.postalCode,
      'addedAt': instance.addedAt.toIso8601String(),
    };
