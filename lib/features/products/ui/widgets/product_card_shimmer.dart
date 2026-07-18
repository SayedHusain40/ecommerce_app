import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    final baseColor = brightness == Brightness.dark
        ? Colors.grey[800]!
        : Colors.grey[300]!;
    final highlightColor = brightness == Brightness.dark
        ? Colors.grey[600]!
        : Colors.grey[100]!;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 138,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: BoxBorder.all(),
                  // color: Colors.white,
                ),
                alignment: .center,
                child: _shimmerBox(width: 100, hight: 100),
              ),
              const Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(backgroundColor: Colors.white, radius: 12),
              ),
            ],
          ),
          const SizedBox(height: 6),
          _shimmerBox(width: 150, hight: 20),
          const SizedBox(height: 4),
          _shimmerBox(width: 60),
          const SizedBox(height: 4),
          _shimmerBox(width: 40),
        ],
      ),
    );
  }

  Widget _shimmerBox({required double width, double hight = 10}) {
    return Container(
      height: hight,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
