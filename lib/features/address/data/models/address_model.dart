import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  final String fullName;
  final String streetAddress;
  final String? postalCode;
  final DateTime addedAt;

  AddressModel({
    required this.fullName,
    required this.streetAddress,
    this.postalCode,
    required this.addedAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}