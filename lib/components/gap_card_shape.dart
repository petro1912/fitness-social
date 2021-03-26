import 'package:flutter/material.dart';
import 'dart:math' as math;

class GapCardShape extends CustomPainter {
  final Color fillColor;
  final PaintingStyle paintingStyle;
  final double gapRadius;
  final double gapPosition;

  GapCardShape({
    this.fillColor = Colors.white,
    this.gapRadius = 10,
    this.gapPosition = .75,
    this.paintingStyle = PaintingStyle.fill,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = fillColor
      ..style = paintingStyle;
    canvas.drawPath(shapePath(size.width, size.height), paint);
  }

  Path shapePath(double width, double height) {
    const double borderRadius = 10;
    Path cutPath = Path()
      ..arcTo(
          Rect.fromCircle(
            center: Offset(0, height * gapPosition),
            radius: gapRadius,
          ),
          -math.pi / 2,
          math.pi,
          true)
      ..arcTo(
          Rect.fromCircle(
            center: Offset(width, height * gapPosition),
            radius: gapRadius,
          ),
          math.pi / 2,
          math.pi,
          true);

    return Path.combine(
        PathOperation.difference,
        Path()
          ..addRRect(RRect.fromLTRBR(
              0, 0, width, height, Radius.circular(borderRadius))),
        cutPath);
  }

  @override
  bool shouldRepaint(GapCardShape oldDelegate) {
    return oldDelegate.fillColor != fillColor ||
        oldDelegate.paintingStyle != paintingStyle;
  }
}
