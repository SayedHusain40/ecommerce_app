import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/features/checkout/data/models/order_model.dart';
import 'package:ecommerce_app/features/order_history/logic/cubit/order_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    return AppScaffold(
      appBar: const AppCustomAppBar(title: 'Order History'),
      body: BlocBuilder<OrderHistoryCubit, List<OrderModel>>(
        builder: (context, orderList) {
          if (orderList.isEmpty) {
            return const Center(child: Text('Order List Empty'));
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              final orderItem = orderList[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: .circular(12),
                  border: .all(color: AppColors.grey150(brightness), width: 1),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        crossAxisAlignment: .center,
                        children: [
                          const Text('Order Date: '),
                          Text(orderItem.formattedDate),
                        ],
                      ),
                    ),
                    const Divider(height: 1, indent: 10, endIndent: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Row(
                        crossAxisAlignment: .center,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.cyan50(brightness),
                            child: SvgPicture.asset(
                              AppIcons.orderHistory(brightness),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text('\$${orderItem.totalPrice}'),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                RouteNames.checkoutReviewItemsScreen,
                                arguments: orderItem.items,
                              );
                            },
                            child: Row(
                              children: [
                                Text('${orderItem.totalQuantity} Products'),
                                SvgPicture.asset(
                                  AppIcons.arrowRight,
                                  width: 14,
                                  height: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: orderList.length,
          );
        },
      ),
    );
  }
}
