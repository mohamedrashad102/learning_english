import 'dart:ui';

import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  const MyPainter(
    this.points, {
    this.color = const Color(0xFFF5F5F5),
    this.strokeWidth = 5,
  });
  final List<List<Offset>> points;
  final double strokeWidth;
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    for (var letter in points) {
      canvas.drawPoints(PointMode.polygon, letter, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
