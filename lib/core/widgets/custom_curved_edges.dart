import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCurvedEdges extends CustomClipper<Path> {
  final double radius;
  const CustomCurvedEdges({this.radius = 32});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    // Curve 1 – bottom left
    path.quadraticBezierTo(
      0,
      size.height - radius,
      radius,
      size.height - radius,
    );

    // Curve 2 – bottom middle (flat)
    path.quadraticBezierTo(
      0,
      size.height - radius,
      size.width - radius,
      size.height - radius,
    );

    // Curve 3 – bottom right
    path.quadraticBezierTo(
      size.width,
      size.height - radius,
      size.width,
      size.height,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}