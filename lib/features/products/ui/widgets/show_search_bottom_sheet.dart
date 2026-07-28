import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/products/ui/widgets/seach_bottom_sheet_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showSearchBottomSheet(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: true,
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ProductCubit>())
      ],
      child: const SearchBottomSheetContent(),
    ),
  );
}
