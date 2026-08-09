import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/features/products/logic/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/products/ui/widgets/search_bottom_sheet_content.dart';
import 'package:ecommerce_app/features/wishlist/logic/wishlist_cubit.dart';
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
        BlocProvider(create: (context) => getIt<ProductCubit>()),
        BlocProvider.value(value: getIt<WishlistCubit>()),
        BlocProvider.value(value: getIt<NavCubit>()),
      ],
      child: const SearchBottomSheetContent(),
    ),
  );
}
