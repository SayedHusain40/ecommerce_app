import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class EmptyAddresses extends StatelessWidget {
  final VoidCallback onAddNewAddress;

  const EmptyAddresses({super.key, required this.onAddNewAddress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on_outlined, size: 48),
          const SizedBox(height: 12),
          Text('No saved addresses yet', style: AppTextStyles.body2Medium),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: onAddNewAddress,
            icon: const Icon(Icons.add),
            label: const Text('Add new address'),
          ),
        ],
      ),
    );
  }
}