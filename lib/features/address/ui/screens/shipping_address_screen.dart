import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/features/address/logic/address_cubit.dart';
import 'package:ecommerce_app/features/address/ui/widgets/address_list_view.dart';
import 'package:flutter/material.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  int? selectedAddressKey;

  late final AddressCubit addressCubit;

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      verticalPadding: 12,
      appBar: AppCustomAppBar(title: 'Shipping address'),
      body: AddressListView(),
    );
  }
}
