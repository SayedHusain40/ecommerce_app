import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/home/data/banners_data.dart';
import 'package:ecommerce_app/features/home/logic/cubit/home_cubit.dart';
import 'package:ecommerce_app/features/home/logic/cubit/home_state.dart';
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
                            color: AppColors.black,
                            borderRadius: .circular(8),
                          ),
                          child: Text(
                            '30% OFF',
                            style: AppTextStyles.body4SemiBold.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'On Headphones',
                          style: AppTextStyles.body3Regular.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          crossAxisAlignment: .end,
                          children: [
                            Text(
                              'Exclusive Sales',
                              style: AppTextStyles.headingH2Bold.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            Container(
                              padding: .all(5),
                              margin: .only(bottom: 2, right: 16),
                              decoration: BoxDecoration(
                                color: AppColors.white,
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
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text('Categories', style: AppTextStyles.headingH3Bold),
                GestureDetector(
                  onTap: () {},
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
            BlocConsumer<HomeCubit, HomeState>(
              listenWhen: (previous, current) =>
                  current is Loading || current is GetCategoryFailure,
              listener: (context, state) {
                state.whenOrNull(
                  getCategoryFailure: (appFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to get Category')),
                    );
                  },
                );
              },
              buildWhen: (previous, current) =>
                  current is Loading ||
                  current is GetCategorySuccess ||
                  current is GetCategoryFailure,
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return SizedBox();
                  },
                  getCategorySuccess: (categoriesList) {
                    return SizedBox(
                      height: 60,
                      child: ListView.separated(
                        scrollDirection: .horizontal,
                        itemCount: categoriesList.length,
                        itemBuilder: (context, index) {
                          final category = categoriesList[index];
                          return Container(
                            padding: .symmetric(vertical: 10, horizontal: 8),
                            width: 76,
                            decoration: BoxDecoration(
                              borderRadius: .circular(12),
                              border: BoxBorder.all(
                                color: AppColors.grey50(brightness),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: .center,
                              children: [
                                Icon(
                                  Icons.category,
                                  size: 22,
                                  color: AppColors.cyan,
                                ),
                                SizedBox(height: 2),
                                Text(
                                  category.name ?? 'Unknown',
                                  style: AppTextStyles.body4SemiBold,
                                  textAlign: .center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 8),
                      ),
                    );
                  },
                  orElse: () => SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
