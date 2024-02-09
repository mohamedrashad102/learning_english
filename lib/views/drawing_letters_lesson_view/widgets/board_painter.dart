import 'dart:ui';

import 'package:flutter/material.dart';

class BoardPainter extends CustomPainter {
  BoardPainter({
    required this.points,
    required this.strokeWidth,
    required this.color,
  });
  final List<Offset> points;
  final double strokeWidth;
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.square
      ..strokeWidth = strokeWidth;

    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
