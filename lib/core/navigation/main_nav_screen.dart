import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/features/home/ui/screens/home_screen.dart';
import 'package:ecommerce_app/features/products/logic/cubit/category_products_cubit.dart';
import 'package:ecommerce_app/features/products/ui/screens/product_screen.dart';
import 'package:ecommerce_app/features/profile/ui/screen/profile_screen.dart';
import 'package:ecommerce_app/features/wishlist/logic/wishlist_cubit.dart';
import 'package:ecommerce_app/features/wishlist/logic/wishlist_state.dart';
import 'package:ecommerce_app/features/wishlist/ui/screen/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _selectedIndex = 0;
  int _categoryIndex = 0;
  String? _categoryName;

  void onSelectCategory(int newSelectedCategoryIndex, String? categoryName) {
    setState(() {
      _selectedIndex = 1;
      _categoryIndex = newSelectedCategoryIndex;
      _categoryName = categoryName;
      _buildTabs();
    });
  }

  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _buildTabs();
  }

  void _buildTabs() {
    _tabs = [
      HomeScreen(onSelectCategory: onSelectCategory),

      // here we add new cubit for productScreen
      // because we want home and product screen separate
      BlocProvider(
        create: (context) => getIt<CategoryProductsCubit>(),
        child: ProductScreen(
          key: ValueKey(_categoryName),
          selectedCategoryIndex: _categoryIndex,
          category: _categoryName,
        ),
      ),

      const WishListScreen(),
      const _PlaceholderScreen(title: 'My Cart'),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _tabs),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
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
  }
}

class AppBadge extends StatelessWidget {
  final Widget child;
  const AppBadge(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (BuildContext context, WishlistState state) {
        final int counts = context.read<WishlistCubit>().countFavorites();
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
