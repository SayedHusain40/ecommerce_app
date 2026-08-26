// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
  items: (json['items'] as List<dynamic>)
      .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  orderAt: DateTime.parse(json['orderAt'] as String),
  status:
      $enumDecodeNullable(_$OrderStatusEnumMap, json['status']) ??
      OrderStatus.ongoing,
  totalPrice: (json['totalPrice'] as num).toDouble(),
  totalQuantity: (json['totalQuantity'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'orderAt': instance.orderAt.toIso8601String(),
      'status': _$OrderStatusEnumMap[instance.status]!,
      'totalPrice': instance.totalPrice,
      'totalQuantity': instance.totalQuantity,
      'items': instance.items,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.ongoing: 'ongoing',
  OrderStatus.completed: 'completed',
  OrderStatus.cancelled: 'cancelled',
};
