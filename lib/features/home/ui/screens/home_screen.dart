import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_cubit.dart';
import 'package:ecommerce_app/features/categories/logic/cubit/category_state.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_card.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_view_list_or_gird.dart';
import 'package:ecommerce_app/features/home/data/banners_data.dart';
import 'package:ecommerce_app/features/categories/ui/widgets/category_loading_shimmer.dart';
import 'package:ecommerce_app/features/products/ui/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [

            // ---- Banner Section ----
            CarouselSlider(
              items: bannerList.map((e) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: AssetImage(e),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 10),
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .end,
                      children: [
                        Container(
                          padding: .all(6),
                          decoration: BoxDecoration(
                            color: AppColors.whiteInDark(brightness),
                            borderRadius: .circular(8),
                          ),
                          child: Text(
                            '30% OFF',
                            style: AppTextStyles.body4SemiBold.copyWith(
                              color: AppColors.blackInDark(brightness),
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'On Headphones',
                          style: AppTextStyles.body3Regular.copyWith(
                            color: AppColors.blackInDark(brightness),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          crossAxisAlignment: .end,
                          children: [
                            Text(
                              'Exclusive Sales',
                              style: AppTextStyles.headingH2Bold.copyWith(
                                color: AppColors.blackInDark(brightness),
                              ),
                            ),
                            Container(
                              padding: .all(5),
                              margin: .only(bottom: 2, right: 16),
                              decoration: BoxDecoration(
                                color: AppColors.blackInDark(brightness),
                                borderRadius: .circular(12),
                              ),
                              child: AnimatedSmoothIndicator(
                                activeIndex: e.indexOf(e),
                                count: 5,
                                effect: WormEffect(
                                  dotHeight: 6,
                                  dotWidth: 6,
                                  spacing: 4,
                                  dotColor: AppColors.grey100,
                                  activeDotColor: AppColors.cyan,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 148,
                // aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                // enlargeFactor: 0.3,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 24),

            // ---- Category Section ----
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text('Categories', style: AppTextStyles.headingH3Bold),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(RouteNames.categoryScreen);
                  },
                  child: Text(
                    'SEE ALL',
                    style: AppTextStyles.body3SemiBold.copyWith(
                      color: AppColors.cyan,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            CategoryViewListOrGird(isGrid: false,),
            SizedBox(height: 24),

            // ---- Latest Products Section ----
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Latest Products', style: AppTextStyles.headingH3Bold),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(RouteNames.productScreen);
                  },
                  child: Text(
                    'SEE ALL',
                    style: AppTextStyles.body3SemiBold.copyWith(
                      color: AppColors.cyan,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Expanded(child: ProductsGridView()),
          ],
        ),
      ),
    );
  }
}
