import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:ecommerce_app/core/theme/constants/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/start_rating.dart';
import 'package:ecommerce_app/features/products/data/model/product_model.dart';
import 'package:flutter/material.dart';

class ReviewsExpansionTile extends StatelessWidget {
  final double rating;
  final List<ReviewModel> reviews;

  const ReviewsExpansionTile({
    super.key,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = context.brightness;
    return ExpansionTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      collapsedShape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),

      backgroundColor: AppColors.grey50(brightness),
      collapsedBackgroundColor: AppColors.grey50(brightness),
      childrenPadding: const .symmetric(vertical: 5),

      title: Row(
        children: [
          Expanded(
            child: Text(
              '$rating (${reviews.length} reviews)',
              style: AppTextStyles.body1Medium,
              // overflow: .ellipsis,
            ),
          ),
          const SizedBox(width: 2),
          StarRating(rating: rating, emptyColor: Colors.blueGrey),
        ],
      ),
      children: [
        ...reviews.take(3).map((item) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            margin: const .symmetric(vertical: 5, horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.grey50(brightness),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: .start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .start,
                      children: [
                        Text(
                          item.reviewerName,
                          style: AppTextStyles.body1Regular,
                        ),
                        const SizedBox(height: 10),
                        Text(item.comment),
                      ],
                    ),
                  ),
                  const SizedBox(width: 3),
                  Column(
                    crossAxisAlignment: .end,
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(item.formattedDate() ?? '-/-/----'),
                      StarRating(
                        rating: item.rating.toDouble(),
                        emptyColor: Colors.blueGrey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
