import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/navigation/logic/nav_cubit.dart';
import 'package:ecommerce_app/core/navigation/main_nav_screen.dart';
import 'package:ecommerce_app/core/storage/hive_box_names.dart';
import 'package:ecommerce_app/core/storage/hive_service.dart';
import 'package:ecommerce_app/features/address/logic/address_cubit.dart';
import 'package:ecommerce_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_cubit.dart';
import 'package:ecommerce_app/features/login/logic/login_cubit.dart';
import 'package:ecommerce_app/features/login/ui/screens/login_screen.dart';
import 'package:ecommerce_app/features/order_history/logic/cubit/order_history_cubit.dart';
import 'package:ecommerce_app/features/products/logic/cubit/category_products_cubit.dart';
import 'package:ecommerce_app/features/products/logic/cubit/latest_products_cubit.dart';
import 'package:ecommerce_app/features/profile/logic/profile_cubit.dart';
import 'package:ecommerce_app/features/verify_email/logic/verify_email_cubit.dart';
import 'package:ecommerce_app/features/verify_email/ui/screens/verify_email_screen.dart';
import 'package:ecommerce_app/features/wishlist/logic/wishlist_cubit.dart';
import 'package:ecommerce_app/responsive/responsive_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class AppAuthState extends StatefulWidget {
  final bool sendEmailOnInit;

  const AppAuthState({super.key, this.sendEmailOnInit = false});

  @override
  State<AppAuthState> createState() => _AppAuthStateState();
}

class _AppAuthStateState extends State<AppAuthState> {
  late final Stream<User?> _authStream = FirebaseAuth.instance
      .authStateChanges()
      .asyncMap((user) async {
        if (user == null) {
          // user signed out, or app started with no session
          if (_lastUid != null) {
            // only close boxes if a user was previously logged in
            await getIt<HiveService>().closeBox(
              HiveBoxNames.wishlist(_lastUid!),
            );
            await getIt<HiveService>().closeBox(HiveBoxNames.cart(_lastUid!));
            await getIt<HiveService>().closeBox(HiveBoxNames.order(_lastUid!));
            await getIt<HiveService>().closeBox(HiveBoxNames.address(_lastUid!));
          }
          _lastUid = null;
        } else if (user.uid != _lastUid) {
          // new login, or switched user
          await getIt<HiveService>().openBox(HiveBoxNames.wishlist(user.uid));
          await getIt<HiveService>().openBox(HiveBoxNames.cart(user.uid));
          await getIt<HiveService>().openBox(HiveBoxNames.order(user.uid));
          await getIt<HiveService>().openBox(HiveBoxNames.address(user.uid));
          _lastUid = user.uid;
          // re-sync cubit state from the newly opened box
          getIt<WishlistCubit>().loadWishlist();
          getIt<CartCubit>().loadCart();
          getIt<OrderHistoryCubit>().loadOrder();
          getIt<AddressCubit>().loadAddresses();
        }
        return user;
      });

  String? _lastUid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink(); 
        }

        FlutterNativeSplash.remove();

        final user = snapshot.data;

        // Not logged in
        if (user == null) {
          return BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          );
        }

        // Logged in but not verified
        if (!user.emailVerified) {
          return BlocProvider(
            create: (context) => getIt<VerifyEmailCubit>(),
            child: VerifyEmailScreen(sendEmailOnInit: widget.sendEmailOnInit),
          );
        }

        // Logged in and verified

        return MultiBlocProvider(
          providers: [
            // these 3 cubits for home screen
            BlocProvider(
              create: (_) => getIt<CategoryCubit>()..getCategories(),
            ),
            BlocProvider(
              create: (_) => getIt<LatestProductsCubit>()
                ..getProducts(
                  limit: context.responsive(mobile: 4, tablet: 8, desktop: 10),
                ),
            ),
            BlocProvider(
              create: (_) => getIt<CategoryProductsCubit>()
                ..getProducts(
                  limit: context.responsive(mobile: 4, tablet: 8, desktop: 10),
                ),
            ),

            // this cubit for favorite products
            BlocProvider.value(value: getIt<WishlistCubit>()),

            BlocProvider.value(value: getIt<CartCubit>()),

            BlocProvider(create: (context) => getIt<ProfileCubit>()),

            BlocProvider.value(value: getIt<NavCubit>()),
          ],
          child: const MainNavScreen(),
        );
      },
    );
  }
}
