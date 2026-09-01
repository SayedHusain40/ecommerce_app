import 'package:ecommerce_app/core/helpers/app_toast.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/address/data/models/address_model.dart';
import 'package:ecommerce_app/features/address/logic/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressCard extends StatelessWidget {
  final MapEntry<int, AddressModel> address;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isDefault;

  const AddressCard({
    super.key,
    required this.address,
    required this.isSelected,
    this.onTap,
    required this.isDefault,
  });

  @override
  Widget build(BuildContext context) {
    final addressCubit = context.read<AddressCubit>();
    final addressValue = address.value;
    final String title = isDefault
        ? '${addressValue.fullName} (Default)'
        : addressValue.fullName;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.cyan : AppColors.cyan50Dark,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (onTap != null) ...[
              Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? AppColors.cyan : Colors.transparent,
                  border: Border.all(
                    color: isSelected ? AppColors.cyan : AppColors.grey100,
                    width: 1.5,
                  ),
                ),
                child: isSelected
                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                    : null,
              ),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.body2Medium),
                  const SizedBox(height: 4),
                  Text(
                    addressValue.streetAddress,
                    style: AppTextStyles.body4Regular.copyWith(
                      color: AppColors.grey100,
                    ),
                  ),
                  if (addressValue.postalCode != null &&
                      addressValue.postalCode!.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      'Postal code: ${addressValue.postalCode}',
                      style: AppTextStyles.body4Regular.copyWith(
                        color: AppColors.grey100,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {
                context.pushNamed(
                  RouteNames.addressFormScreen,
                  arguments: {'addressKey': address.key},
                );
              },
              icon: const Icon(Icons.edit_outlined, size: 20),
              color: AppColors.grey100,
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 12),
            IconButton(
              onPressed: () {
                if (address.key == 0) {
                  AppToast.warning(context, 'Can\'t delete default address');
                  return;
                }
                addressCubit.removeAddress(addressKey: address.key);
              },
              icon: const Icon(Icons.delete_outline, size: 20),
              color: Colors.redAccent,
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }
}
