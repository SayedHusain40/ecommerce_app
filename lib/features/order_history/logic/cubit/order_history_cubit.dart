import 'package:ecommerce_app/features/checkout/data/models/order_model.dart';
import 'package:ecommerce_app/features/order_history/data/repos/order_history_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHistoryCubit extends Cubit<List<OrderModel>> {
  final OrderHistoryRepo orderHistoryRepo;
  OrderHistoryCubit(this.orderHistoryRepo) : super([]);

  Future<void> loadOrder() async {
    final list = await orderHistoryRepo.loadOrder();
    emit(list);
  }

  void addNewOrder({required OrderModel orderModel}) {
    emit([orderModel, ...state]);
  }
}
