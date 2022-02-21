import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    final dx = size.width / 8;
    const dy = 10.0;

    path.lineTo(0.0, size.height - 2 * dy);

    path.conicTo(
      dx,
      size.height - (dy * 0.75),
      dx * 2,
      size.height,
      1,
    );

    path.conicTo(
      dx * 3,
      size.height - (dy * 0.25),
      dx * 4,
      size.height - dy,
      1,
    );

    path.conicTo(
      dx * 5,
      size.height - (dy * 1.75),
      dx * 6,
      size.height - (dy * 2),
      1,
    );

    path.conicTo(
      dx * 7,
      size.height - (dy * 1.25),
      size.width,
      size.height,
      1,
    );

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
