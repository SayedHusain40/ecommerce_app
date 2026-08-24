import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class QuantitySelector extends StatefulWidget {
  final int quantity;
  final int productId;
  final int minimumOrderQuantity;
  final void Function(int)? onChangeQuantity;
  final bool isComeFromCartScreen;
  final bool isDisabled;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.productId,
    this.onChangeQuantity,
    required this.minimumOrderQuantity,
    this.isComeFromCartScreen = false,
    this.isDisabled = false,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int currentQuantity = widget.quantity;

  late CartCubit cartCubit = context.read<CartCubit>();

  @override // TODO save in notes
  void didUpdateWidget(covariant QuantitySelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.quantity != widget.quantity) {
      currentQuantity = widget.quantity;
    }
  }

  void onAdd() {
    setState(() {
      if (currentQuantity < widget.minimumOrderQuantity) {
        currentQuantity++;
        changeQuantity(isAdd: true);
      }
    });
  }

  void onMinus() {
    setState(() {
      if (currentQuantity > 1) {
        currentQuantity--;
        changeQuantity(isAdd: false);
      }
    });
  }

  void changeQuantity({required bool isAdd}) {
    if (widget.onChangeQuantity != null) {
      // this for product details screen
      widget.onChangeQuantity!(currentQuantity);
    }

    // this will run only for cartScreen
    if (widget.isComeFromCartScreen) {
      cartCubit.addOrMinus(productId: widget.productId, isAdd: isAdd);
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;

    return Container(
      width: 96,
      height: 32,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: .circular(8),
        border: BoxBorder.all(width: 1, color: AppColors.grey50(brightness)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              onPressed: widget.isDisabled ? null : onMinus,
              icon: SvgPicture.asset(
                AppIcons.minus(brightness),

                colorFilter: widget.isDisabled
                    ? const ColorFilter.mode(AppColors.grey100, BlendMode.srcIn)
                    : null,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                currentQuantity.toString(),
                style: AppTextStyles.body1Medium.copyWith(
                  height: 1,
                  color: widget.isDisabled ? AppColors.grey100 : null,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 24,
            height: 24,
            child: InkWell(
              borderRadius: BorderRadius.circular(4),
              onTap: widget.isDisabled ? null : onAdd,
              child: Ink(
                child: SvgPicture.asset(
                  AppIcons.add(brightness),
                  width: 24,
                  height: 24,
                  colorFilter: widget.isDisabled
                      ? const ColorFilter.mode(
                          AppColors.grey100,
                          BlendMode.srcIn,
                        )
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
