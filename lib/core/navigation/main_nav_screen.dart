import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/features/home/ui/screens/home_screen.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/products/logic/cubit/category_products_cubit.dart';
import 'package:ecommerce_app/features/products/ui/screens/product_screen.dart';
import 'package:ecommerce_app/features/profile/ui/screen/profile_screen.dart';
import 'package:ecommerce_app/features/wishlist/logic/wishlist_cubit.dart';
import 'package:ecommerce_app/features/wishlist/ui/screen/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _buildTabs();
  }

  void _buildTabs() {
    _tabs = [
      const HomeScreen(),

      // here we add new cubit for productScreen
      // because we want home and product screen separate
      BlocProvider(
        create: (context) => getIt<CategoryProductsCubit>(),
        child: BlocBuilder<NavCubit, NavModel>(
          buildWhen: (previous, current) => current.screenIndex == 1,
          builder: (context, navModel) {
            return ProductScreen(
              key: ValueKey(navModel.categoryName),
              selectedCategoryIndex: navModel.categoryIndex,
              category: navModel.categoryName,
            );
          },
        ),
      ),

      const WishListScreen(),
      const _PlaceholderScreen(title: 'My Cart'),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<NavCubit>();

    return BlocBuilder<NavCubit, NavModel>(
      buildWhen: (previous, current) =>
          previous.screenIndex != current.screenIndex,
      builder: (context, navModel) {
        return Scaffold(
          body: IndexedStack(index: navModel.screenIndex, children: _tabs),
          bottomNavigationBar: NavigationBar(
            selectedIndex: navModel.screenIndex,
            onDestinationSelected: (index) {
              navCubit.changeNav(selectedNav: index);
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.grid_view_outlined),
                selectedIcon: Icon(Icons.grid_view),
                label: 'Products',
              ),
              NavigationDestination(
                icon: AppBadge(Icon(Icons.favorite_outline_rounded)),
                selectedIcon: AppBadge(Icon(Icons.favorite_rounded)),
                label: 'Wishlist',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined),
                selectedIcon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}

class AppBadge extends StatelessWidget {
  final Widget child;
  const AppBadge(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, List<ProductModel>>(
      builder: (context, state) {
        final int counts = state.length;
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

class _PlaceholderScreen extends StatelessWidget {
  final String title;

  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title screen coming soon')),
    );
  }
}
