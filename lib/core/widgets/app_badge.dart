import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBadge<T extends Cubit<List>> extends StatelessWidget {
  final Widget child;
  final bool sumQuantity;

  const AppBadge(this.child, {super.key, this.sumQuantity = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, List>(
      builder: (context, state) {
        final int counts = sumQuantity
            ? state.fold<int>(0, (sum, item) => sum + (item.quantity as int))
            : state.length;

        return Badge(
          label: Text(counts.toString()),
          backgroundColor: Colors.red,
          textColor: Colors.white,
          isLabelVisible: counts > 0,
          child: child,
        );
      },
    );
  }
}