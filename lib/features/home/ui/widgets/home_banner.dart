import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/home/data/banners_data.dart';
import 'package:ecommerce_app/responsive/layout_dimensions.dart';
import 'package:ecommerce_app/responsive/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    final l10n = context.l10n;

    return CarouselSlider(
      items: bannerList.map((e) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.only(
            top: 10,
            left: 12,
            right: 12,
            bottom: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: DecorationImage(image: AssetImage(e), fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: const BoxConstraints(minHeight: 24),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.whiteInDark(brightness),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  l10n.bannerDiscount,
                  style: AppTextStyles.body4SemiBold.copyWith(
                    color: AppColors.blackInDark(brightness),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                l10n.bannerOnHeadphones,
                style: AppTextStyles.body3Regular.copyWith(
                  color: AppColors.blackInDark(brightness),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      l10n.bannerExclusiveSales,
                      style: AppTextStyles.headingH2Bold.copyWith(
                        color: AppColors.blackInDark(brightness),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(bottom: 2),
                    decoration: BoxDecoration(
                      color: AppColors.blackInDark(brightness),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: AnimatedSmoothIndicator(
                      activeIndex: _currentIndex,
                      count: bannerList.length,
                      effect: const WormEffect(
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
        );
      }).toList(),
      options: CarouselOptions(
        aspectRatio: context.responsive(
          mobile: LayoutDimensions.mobileBannerRatio,
          tablet: LayoutDimensions.tabletDesktopBannerRatio,
          desktop: LayoutDimensions.tabletDesktopBannerRatio,
        ),
        // height: 148,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
