  import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';
  import 'package:intl/intl.dart';
  import 'package:json_annotation/json_annotation.dart';

  part 'order_model.g.dart';

  @JsonEnum() // TODO need undrsta...
  enum OrderStatus { ongoing, completed, cancelled }

  @JsonSerializable()
  class OrderModel {
    final DateTime orderAt;
    final OrderStatus status;
    final double totalPrice;

    @JsonKey(defaultValue: 0)
    final int totalQuantity;
    final List<CartItemModel> items;

    OrderModel({
      required this.items,
      required this.orderAt,
      this.status = OrderStatus.ongoing,
      required this.totalPrice,
      required this.totalQuantity,
    });

    String get formattedDate {
      return DateFormat('MMM dd, yyyy • hh:mm a').format(orderAt);
    }

    factory OrderModel.fromJson(Map<String, dynamic> json) =>
        _$OrderModelFromJson(json);

    Map<String, dynamic> toJson() => _$OrderModelToJson(this);
  }
