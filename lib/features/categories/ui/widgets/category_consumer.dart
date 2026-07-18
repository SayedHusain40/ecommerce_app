import 'package:ecommerce_app/features/categories/data/model/category_model.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_cubit.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryConsumer extends StatelessWidget {
  final Widget Function(BuildContext context) onLoading;
  final Widget Function(BuildContext context, List<CategoryModel> categories) onSuccess;

  const CategoryConsumer({
    super.key,
    required this.onLoading,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listenWhen: (previous, current) => current is GetCategoryFailure,
      listener: (context, state) {
        state.whenOrNull(
          getCategoryFailure: (appFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to get Category')),
            );
          },
        );
      },
      buildWhen: (previous, current) =>
          current is GetCategoryLoading ||
          current is GetCategorySuccess ||
          current is GetCategoryFailure,
      builder: (context, state) {
        return state.maybeWhen(
          getCategoryLoading: () => onLoading(context),
          getCategorySuccess: (categories) => onSuccess(context, categories),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}