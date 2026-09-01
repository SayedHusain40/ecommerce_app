import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/widgets/required_label.dart';
import 'package:flutter/material.dart';

class AddressForm extends StatefulWidget {
  final GlobalKey<FormState> addressKeyForm;
  final TextEditingController fullNameController;
  final TextEditingController streetAddressController;
  final TextEditingController? postalCodeController;

  const AddressForm({
    super.key,
    required this.fullNameController,
    required this.streetAddressController,
    required this.postalCodeController,
    required this.addressKeyForm,
  });

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.addressKeyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RequiredLabel('Full Name'),
          const SizedBox(height: 8),
          TextFormField(
            controller: widget.fullNameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter full name',
            ),
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return 'Full name is required';
              }
              if (value!.trim().length < 3) {
                return 'Full name must be at least 3 characters';
              }
              if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value.trim())) {
                return 'Full name can only contain letters';
              }

              return null;
            },
          ),

          const SizedBox(height: 12),

          const RequiredLabel('Street Address'),
          const SizedBox(height: 8),
          TextFormField(
            controller: widget.streetAddressController,
            decoration: const InputDecoration(hintText: 'Enter street address'),

            validator: (value) {
              if (value.isNullOrEmpty()) {
                return 'Street address is required';
              }
              if (value!.trim().length < 5) {
                return 'Please enter a more detailed address';
              }

              return null;
            },
          ),

          const SizedBox(height: 12),

          const RequiredLabel('Postal Code (optional)', isRequired: false),
          const SizedBox(height: 8),
          TextFormField(
            controller: widget.postalCodeController,
            decoration: const InputDecoration(hintText: 'Enter postal code'),
            validator: (value) {
              if (value.isNullOrEmpty()) return null; // optional field
              if (!RegExp(r'^\d{4,6}$').hasMatch(value!.trim())) {
                return 'Enter a valid postal code';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
