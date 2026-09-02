import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/features/address/data/models/address_model.dart';
import 'package:ecommerce_app/features/address/logic/address_cubit.dart';
import 'package:ecommerce_app/features/address/ui/widgets/address_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewAddressScreen extends StatefulWidget {
  final bool isFirstAddress;
  final int? addressKey;
  const AddNewAddressScreen({
    super.key,
    this.isFirstAddress = false,
    this.addressKey,
  });

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  final addressKeyForm = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  late final addressCubit = context.read<AddressCubit>();

  bool isAddressDefault = false;

  bool isUpdate = false;

  AddressModel? addressToUpdate;

  void onSaveAddress() {
    if (!addressKeyForm.currentState!.validate()) return;

    if (!isUpdate) {
      addressCubit.addNewAddress(
        addressModel: AddressModel(
          fullName: fullNameController.text.trim(),
          streetAddress: streetAddressController.text.trim(),
          postalCode: postalCodeController.text.trim(),
          addedAt: DateTime.now(),
        ),
        isAddressDefault: isAddressDefault,
      );
    } else {
      addressCubit.updateAddress(
        addressKey: widget.addressKey!,
        updatedAddressModel: AddressModel(
          fullName: fullNameController.text.trim(),
          streetAddress: streetAddressController.text.trim(),
          postalCode: postalCodeController.text.trim(),
          addedAt: addressToUpdate!.addedAt,
        ),
        isAddressDefault: isAddressDefault,
      );
    }

    context.pop();
  }

  @override
  void initState() {
    super.initState();

    if (widget.addressKey != null) {
      isUpdate = true;
      addressToUpdate = addressCubit.getAddress(addressLey: widget.addressKey!);

      if (addressToUpdate != null) {
        fullNameController.text = addressToUpdate!.fullName;
        streetAddressController.text = addressToUpdate!.streetAddress;
        postalCodeController.text = addressToUpdate!.postalCode ?? '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 12,
      appBar: const AppCustomAppBar(title: 'Address Form'),
      body: Column(
        children: [
          AddressForm(
            addressKeyForm: addressKeyForm,
            fullNameController: fullNameController,
            streetAddressController: streetAddressController,
            postalCodeController: postalCodeController,
          ),
          const SizedBox(height: 8),
          if (!widget.isFirstAddress && widget.addressKey != 0)
            CheckboxListTile(
              value: isAddressDefault,
              onChanged: (value) {
                setState(() {
                  isAddressDefault = value ?? false;
                });
              },
              title: const Text('Set as default address'),
              controlAffinity: ListTileControlAffinity
                  .leading, // optional: checkbox on the left
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onSaveAddress,
            child: Text(isUpdate ? 'Update' : 'Save'),
          ),
        ],
      ),
    );
  }
}
