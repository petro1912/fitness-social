import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final Color color;
  final PaintingStyle paintingStyle;
  final double size;
  final bool isLeft;

  TrianglePainter(
      {this.color,
      this.isLeft = false,
      this.size = 10,
      this.paintingStyle = PaintingStyle.fill});

  @override
  void paint(Canvas canvas, Size _) {
    Paint paint = Paint()
      ..color = color
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size), paint);
  }

  Path getTrianglePath(double size) {
    print(isLeft);
    if (isLeft != null && isLeft)
      return Path()
        ..moveTo(0, size)
        ..lineTo(size, 0)
        ..lineTo(size, size)
        ..lineTo(0, size);
    else
      return Path()
        ..moveTo(0, 0)
        ..lineTo(0, size)
        ..lineTo(size, size)
        ..lineTo(0, 0);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.paintingStyle != paintingStyle;
  }
}
