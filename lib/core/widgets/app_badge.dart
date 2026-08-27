import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBadge<T extends Cubit<dynamic>> extends StatelessWidget {
  final Widget child;
  final bool sumQuantity;

  const AppBadge(this.child, {super.key, this.sumQuantity = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, dynamic>(
      builder: (context, state) {
        List list;
        if (state is Map) {
          list = state.values.toList();
        } else {
          list = state;
        }

        final int counts = sumQuantity
            ? list.fold<int>(0, (sum, item) => sum + (item.quantity as int))
            : list.length;

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
