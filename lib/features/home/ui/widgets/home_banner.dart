import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/features/home/data/banners_data.dart';
import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final l10n = AppLocalizations.of(context)!;

    return CarouselSlider(
      items: bannerList.map((e) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: DecorationImage(image: AssetImage(e) , fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .end,
              children: [
                Container(
                  padding: const .all(6),
                  decoration: BoxDecoration(
                    color: AppColors.whiteInDark(brightness),
                    borderRadius: .circular(8),
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
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .end,
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
                      padding: const .all(5),
                      margin: const .only(bottom: 2),
                      decoration: BoxDecoration(
                        color: AppColors.blackInDark(brightness),
                        borderRadius: .circular(12),
                      ),
                      child: AnimatedSmoothIndicator(
                        activeIndex: e.indexOf(e),
                        count: 5,
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
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        // enlargeFactor: 0.3,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
