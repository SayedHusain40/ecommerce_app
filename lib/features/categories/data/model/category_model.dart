import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final String? slug;
  @JsonKey(defaultValue: 'Unknown')
  final String? name;
  final String? url;

  CategoryModel({required this.slug, required this.name, required this.url});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
