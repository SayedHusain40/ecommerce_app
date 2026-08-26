// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistItemModel _$WishlistItemModelFromJson(Map<String, dynamic> json) =>
    WishlistItemModel(
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      addedAt: DateTime.parse(json['addedAt'] as String),
    );

Map<String, dynamic> _$WishlistItemModelToJson(WishlistItemModel instance) =>
    <String, dynamic>{
      'product': instance.product,
      'addedAt': instance.addedAt.toIso8601String(),
    };
