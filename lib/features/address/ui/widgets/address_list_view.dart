import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/features/address/data/models/address_model.dart';
import 'package:ecommerce_app/features/address/logic/address_cubit.dart';
import 'package:ecommerce_app/features/address/ui/widgets/address_card.dart';
import 'package:ecommerce_app/features/address/ui/widgets/empty_addresses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressListView extends StatefulWidget {
  final int? selectedAddressKey;
  final ValueChanged<int>? onSelect;

  const AddressListView({super.key, this.selectedAddressKey, this.onSelect});

  @override
  State<AddressListView> createState() => _AddressListViewState();
}

class _AddressListViewState extends State<AddressListView> {
  void onAddNewAddress({bool isFirstAddress = false}) {
    context.pushNamed(
      RouteNames.addressFormScreen,
      arguments: {'isFirstAddress': isFirstAddress},
    );
  }

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, Map<int, AddressModel>>(
      builder: (context, addressMap) {
        final entries = addressMap.entries.toList();

        if (entries.isEmpty) {
          return EmptyAddresses(
            onAddNewAddress: () => onAddNewAddress(isFirstAddress: true),
          );
        }

        return ListView(
          children: [
            ...entries.map((entry) {
              final key = entry.key;
              final isDefault = key == 0;
              final address = entry;
              final isSelected = widget.selectedAddressKey == key;

              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AddressCard(
                  isDefault: isDefault,
                  address: address,
                  isSelected: isSelected,
                  onTap: widget.onSelect == null
                      ? null
                      : () => widget.onSelect!(key),
                ),
              );
            }),

            const SizedBox(height: 4),
            OutlinedButton.icon(
              onPressed: onAddNewAddress,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: AppColors.grey100,
                  style: BorderStyle.solid,
                ),
                minimumSize: const Size.fromHeight(48),
              ),
              icon: const Icon(Icons.add),
              label: const Text('Add new address'),
            ),
          ],
        );
      },
    );
  }
}
