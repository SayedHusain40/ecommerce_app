import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wishlist_item_model.g.dart';

@JsonSerializable()
class WishlistItemModel {
  final ProductModel product;
  final DateTime addedAt;

  WishlistItemModel({required this.product, required this.addedAt});

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$WishlistItemModelToJson(this);
}