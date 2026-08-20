import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/ui/screens/cart_screen.dart';
import 'package:ecommerce_app/features/home/ui/screens/home_screen.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:ecommerce_app/features/products/logic/cubit/category_products_cubit.dart';
import 'package:ecommerce_app/features/products/ui/screens/product_screen.dart';
import 'package:ecommerce_app/features/profile/ui/screens/profile_screen.dart';
import 'package:ecommerce_app/features/wishlist/logic/wishlist_cubit.dart';
import 'package:ecommerce_app/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:ecommerce_app/responsive/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
      const CartScreen(),
      const ProfileScreen(),
    ];
  }

  // Shared destination data — built once, mapped into either
  // NavigationDestination (mobile bottom bar) or NavigationRailDestination
  // (tablet/desktop side rail) depending on screen size.
  List<_NavItem> _navItems(AppLocalizations l10n, Brightness brightness) {
    return [
      _NavItem(
        icon: SvgPicture.asset(
          AppIcons.inactiveHome(brightness),
          width: 24,
          height: 24,
        ),
        selectedIcon: SvgPicture.asset(
          AppIcons.activeHome,
          width: 24,
          height: 24,
        ),
        label: l10n.home,
      ),
      _NavItem(
        icon: SvgPicture.asset(
          AppIcons.inactiveCategory(brightness),
          width: 24,
          height: 24,
        ),
        selectedIcon: SvgPicture.asset(
          AppIcons.activeCategory,
          width: 24,
          height: 24,
        ),
        label: l10n.products,
      ),
      _NavItem(
        icon: AppBadge<WishlistCubit>(
          SvgPicture.asset(
            AppIcons.inactiveHeart(brightness),
            width: 24,
            height: 24,
          ),
        ),
        selectedIcon: AppBadge<WishlistCubit>(
          SvgPicture.asset(AppIcons.activeHeart, width: 24, height: 24),
        ),
        label: l10n.wishlist,
      ),
      _NavItem(
        icon: AppBadge<CartCubit>(
          sumQuantity: true,
          SvgPicture.asset(
            AppIcons.inactiveShoppingCart(brightness),
            width: 24,
            height: 24,
          ),
        ),
        selectedIcon: AppBadge<CartCubit>(
          sumQuantity: true,
          SvgPicture.asset(AppIcons.activeShoppingCart, width: 24, height: 24),
        ),
        label: l10n.cart,
      ),
      _NavItem(
        icon: SvgPicture.asset(
          AppIcons.inactiveProfile(brightness),
          width: 24,
          height: 24,
        ),
        selectedIcon: SvgPicture.asset(
          AppIcons.activeProfile,
          width: 24,
          height: 24,
        ),
        label: l10n.profile,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<NavCubit>();
    final l10n = context.l10n;
    final brightness = context.brightness;

    return BlocBuilder<NavCubit, NavModel>(
      buildWhen: (previous, current) =>
          previous.screenIndex != current.screenIndex,
      builder: (context, navModel) {
        final items = _navItems(l10n, brightness);
        final content = IndexedStack(
          index: navModel.screenIndex,
          children: _tabs,
        );

        // MOBILE: bottom NavigationBar
        if (context.isMobile) {
          return Scaffold(
            body: content,
            bottomNavigationBar: NavigationBar(
              selectedIndex: navModel.screenIndex,
              onDestinationSelected: (index) {
                navCubit.changeNav(selectedNav: index);
              },
              destinations: items
                  .map(
                    (item) => NavigationDestination(
                      icon: item.icon,
                      selectedIcon: item.selectedIcon,
                      label: item.label,
                    ),
                  )
                  .toList(),
            ),
          );
        }

        // TABLET / DESKTOP: side NavigationRail
        return Scaffold(
          body: Row(
            children: [
              NavigationRail(
                selectedIndex: navModel.screenIndex,
                onDestinationSelected: (index) {
                  navCubit.changeNav(selectedNav: index);
                },
                labelType: NavigationRailLabelType.all,
                mainAxisAlignment: .center,

                destinations: items
                    .map(
                      (item) => NavigationRailDestination(
                        icon: item.icon,
                        selectedIcon: item.selectedIcon,
                        label: Text(item.label),
                      ),
                    )
                    .toList(),
              ),
              // const VerticalDivider(width: 1),
              Expanded(child: content),
            ],
          ),
        );
      },
    );
  }
}

class _NavItem {
  final Widget icon;
  final Widget selectedIcon;
  final String label;

  _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}

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
