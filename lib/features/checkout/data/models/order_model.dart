import 'package:ecommerce_app/features/cart/data/models/cart_item_model.dart';

class OrderModel {
  final String orderId;
  final List<CartItemModel> items;
  OrderModel({required this.orderId, required this.items});
}