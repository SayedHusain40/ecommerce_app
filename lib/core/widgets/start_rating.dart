import 'package:ecommerce_app/core/theme/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double starSize;
  final Color? emptyColor;

  const StarRating({
    super.key,
    required this.rating,
    this.starSize = 18.0,
    this.emptyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 3),
          child: BuildStar(
            rating: rating,
            index: index,
            starSize: starSize,
            emptyColor: emptyColor,
          ),
        ),
      ),
    );
  }
}

class BuildStar extends StatelessWidget {
  final double rating;
  final int index;
  final double starSize;
  final Color? emptyColor;

  const BuildStar({
    super.key,
    required this.rating,
    required this.index,
    required this.starSize,
    this.emptyColor,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    final starEmptyColor = emptyColor ?? AppColors.grey50(brightness);

    final fill = (rating - index).clamp(0.0, 1.0);

    return Stack(
      children: [
        Icon(Icons.star_rounded, size: starSize, color: starEmptyColor),
        ClipRect(
          clipper: _StarClipper(fill),
          child: Icon(
            Icons.star_rounded,
            size: starSize,
            color: AppColors.orange2,
          ),
        ),
      ],
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  const _StarClipper(this.fill);
  final double fill;

  @override
  Rect getClip(Size size) =>
      Rect.fromLTWH(0, 0, size.width * fill, size.height);

  @override
  bool shouldReclip(covariant _StarClipper old) => old.fill != fill;
}
