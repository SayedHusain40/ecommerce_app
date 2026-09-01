import 'package:ecommerce_app/core/helpers/app_toast.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/widgets/app_custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/app_scaffold.dart';
import 'package:ecommerce_app/features/address/data/models/address_model.dart';
import 'package:ecommerce_app/features/address/logic/address_cubit.dart';
import 'package:ecommerce_app/features/address/ui/widgets/address_form.dart';
import 'package:ecommerce_app/features/address/ui/widgets/address_list_view.dart';
import 'package:ecommerce_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:ecommerce_app/features/checkout/logic/cubit/checkout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutShippingScreen extends StatefulWidget {
  const CheckoutShippingScreen({super.key});

  @override
  State<CheckoutShippingScreen> createState() => _CheckoutShippingScreenState();
}

class _CheckoutShippingScreenState extends State<CheckoutShippingScreen> {
  final addressKeyForm = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  late final checkoutCubit = context.read<CheckoutCubit>();
  late final addressCubit = context.read<AddressCubit>();

  bool isAddressDefault = false;

  AddressModel? addressModel;

  late int addressToShow;

  bool isAddressListEmpty = true;

  @override
  void initState() {
    super.initState();

    addressToShow =
        0; // as Default, but user can change it when select another one

    isAddressListEmpty = addressCubit.state.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        state.whenOrNull(
          successShipping: () {
            context.pushNamed(RouteNames.checkoutPaymentScreen);
          },
        );
      },
      child: AppScaffold(
        verticalPadding: 12,
        bottomNavigationBar: Padding(
          padding: const .symmetric(vertical: 27, horizontal: 16),
          child: ElevatedButton(
            onPressed: () {
              if (isAddressListEmpty) {
                if (!addressKeyForm.currentState!.validate()) return;

                checkoutCubit.onSaveShippingInfo(
                  newAddressModel: AddressModel(
                    fullName: fullNameController.text.trim(),
                    streetAddress: streetAddressController.text.trim(),
                    postalCode: postalCodeController.text.trim(),
                    addedAt: DateTime.now(),
                  ),
                  saveAddress: true,
                );
              } else {
                final selectedAddress = addressCubit.getAddress(
                  addressLey: addressToShow,
                );
                if (selectedAddress == null) {
                  AppToast.info(context, 'Please Select a an address');
                  return;
                }

                checkoutCubit.onSaveShippingInfo(
                  newAddressModel: selectedAddress,
                );
              }
            },
            child: const Text('Save'),
          ),
        ),
        appBar: const AppCustomAppBar(title: 'Checkout'),
        body: BlocBuilder<AddressCubit, Map<int, AddressModel>>(
          builder: (context, addressMap) {
            final addressList = addressMap.values.toList();

            if (addressList.isEmpty) {
              return AddressForm(
                fullNameController: fullNameController,
                streetAddressController: streetAddressController,
                postalCodeController: postalCodeController,
                addressKeyForm: addressKeyForm,
              );
            }

            return AddressListView(
              selectedAddressKey: addressToShow,
              onSelect: (value) {
                setState(() {
                  addressToShow = value;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
