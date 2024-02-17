import 'package:flutter/material.dart';

import '../../../src.export.dart';

class CornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cornerSize = 80.0;
    const strokeWidth = 2.0;
    final paint = Paint()
      ..color = ColorName.amber
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Draw top-left corner
    canvas.drawRect(
      const Rect.fromLTWH(0, 0, cornerSize, strokeWidth),
      paint,
    );
    canvas.drawRect(
      const Rect.fromLTWH(0, 0, strokeWidth, cornerSize),
      paint,
    );

    // Draw top-right corner
    canvas.drawRect(
      Rect.fromLTWH(size.width - cornerSize, 0, cornerSize, strokeWidth),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(size.width - strokeWidth, 0, strokeWidth, cornerSize),
      paint,
    );

    // Draw bottom-left corner
    canvas.drawRect(
      Rect.fromLTWH(0, size.height - strokeWidth, cornerSize, strokeWidth),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(0, size.height - cornerSize, strokeWidth, cornerSize),
      paint,
    );

    // Draw bottom-right corner
    canvas.drawRect(
      Rect.fromLTWH(
        size.width - cornerSize,
        size.height - strokeWidth,
        cornerSize,
        strokeWidth,
      ),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        size.width - strokeWidth,
        size.height - cornerSize,
        strokeWidth,
        cornerSize,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
