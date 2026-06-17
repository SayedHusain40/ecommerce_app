import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/widgets/custom_curved_edges.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImageGallery extends StatelessWidget {
  final ProductModel productModel;
  const ProductImageGallery({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final PageController pageController = PageController();
    return ClipPath(
      clipper: const CustomCurvedEdges(),
      child: Container(
        width: double.infinity,
        height: 340,
        color: const Color(0xFFD6D8E5),
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: productModel.images.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        productModel.images[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: .circular(12),
                        color: AppColors.grey50(brightness),
                      ),
                      margin: .only(bottom: 40),
                      child: AnimatedSmoothIndicator(
                        onDotClicked: (dotIndex) {
                          pageController.animateToPage(
                            dotIndex,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        activeIndex: index,
                        count: productModel.images.length,
                        effect: WormEffect(
                          spacing: 4.0,
                          dotWidth: 6.0,
                          dotHeight: 6.0,
                          dotColor: AppColors.grey100,
                          activeDotColor: AppColors.green,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: SvgPicture.asset(
                      AppIcons.arrowLeft(brightness),
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.whiteInDark(brightness),
                    foregroundColor: AppColors.blackInDark(brightness),
                    radius: 16,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
