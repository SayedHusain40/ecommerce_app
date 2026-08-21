import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'product_model.g.dart';

// TODO : explicitToJson
@JsonSerializable(explicitToJson: true)
class ProductResponseModel {
  @JsonKey(defaultValue: [])
  final List<ProductModel> products;
  @JsonKey(defaultValue: 0)
  final int total;
  @JsonKey(defaultValue: 0)
  final int skip;
  @JsonKey(defaultValue: 0)
  final int limit;

  ProductResponseModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductModel {
  @JsonKey(defaultValue: 0)
  final int id;

  @JsonKey(defaultValue: '')
  final String title;

  @JsonKey(defaultValue: '')
  final String description;

  @JsonKey(defaultValue: '')
  final String category;

  @JsonKey(defaultValue: 0.0)
  final double price;

  @JsonKey(defaultValue: 0.0)
  final double discountPercentage;

  @JsonKey(defaultValue: 0.0)
  final double rating;

  @JsonKey(defaultValue: 0)
  final int stock;

  @JsonKey(defaultValue: [])
  final List<String> tags;

  @JsonKey(defaultValue: '')
  final String brand;

  @JsonKey(defaultValue: '')
  final String sku;

  @JsonKey(defaultValue: 0)
  final int weight;

  final DimensionsModel? dimensions;

  @JsonKey(defaultValue: '')
  final String warrantyInformation;

  @JsonKey(defaultValue: '')
  final String shippingInformation;

  @JsonKey(defaultValue: '')
  final String availabilityStatus;

  @JsonKey(defaultValue: [])
  final List<ReviewModel> reviews;

  @JsonKey(defaultValue: '')
  final String returnPolicy;

  @JsonKey(defaultValue: 0)
  final int minimumOrderQuantity;

  final MetaModel? meta;

  @JsonKey(defaultValue: [])
  final List<String> images;

  @JsonKey(defaultValue: '')
  final String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  double get discountedPrice => price - (price * discountPercentage / 100);
  String get discountPriceString => discountedPrice.toStringAsFixed(2);
}

@JsonSerializable()
class DimensionsModel {
  @JsonKey(defaultValue: 0.0)
  final double width;

  @JsonKey(defaultValue: 0.0)
  final double height;

  @JsonKey(defaultValue: 0.0)
  final double depth;

  DimensionsModel({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory DimensionsModel.fromJson(Map<String, dynamic> json) =>
      _$DimensionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionsModelToJson(this);
}

@JsonSerializable()
class ReviewModel {
  @JsonKey(defaultValue: 0)
  final int rating;

  @JsonKey(defaultValue: '')
  final String comment;

  final DateTime? date;

  @JsonKey(defaultValue: '')
  final String reviewerName;

  @JsonKey(defaultValue: '')
  final String reviewerEmail;

  final formatter = DateFormat.yMd();

  ReviewModel({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);

  String? formattedDate() {
    if (date == null) {
      return null;
    }
    return formatter.format(date!);
  }
}

@JsonSerializable()
class MetaModel {
  final DateTime? createdAt;

  final DateTime? updatedAt;

  @JsonKey(defaultValue: '')
  final String barcode;

  @JsonKey(defaultValue: '')
  final String qrCode;

  MetaModel({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
}
