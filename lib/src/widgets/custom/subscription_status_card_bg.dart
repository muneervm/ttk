import 'package:flutter/material.dart';

class SubscriptionStatusCardBg extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(0.15);
    canvas.drawCircle(Offset(size.width * 0.4063490, size.height * 0.3434525),
        size.width * 0.1587302, paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Colors.white.withOpacity(0.15);
    canvas.drawCircle(Offset(size.width * 0.9015885, size.height * 0.8082150),
        size.width * 0.09841250, paint1Fill);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.white.withOpacity(0.15);
    canvas.drawCircle(Offset(size.width * 0.7206354, size.height * 0.2596438),
        size.width * 0.02222224, paint2Fill);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = Colors.white.withOpacity(0.15);
    canvas.drawCircle(Offset(size.width * 0.5650781, size.height * 0.7777387),
        size.width * 0.02222224, paint3Fill);

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = Colors.white.withOpacity(0.15);
    canvas.drawCircle(Offset(size.width * 0.04126984, size.height * 0.06916788),
        size.width * 0.04126984, paint4Fill);

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = Colors.white.withOpacity(0.15);
    canvas.drawCircle(Offset(size.width * 0.8126979, size.height * 0.07678475),
        size.width * 0.009523802, paint5Fill);

    Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = Colors.white.withOpacity(0.15);
    canvas.drawCircle(Offset(size.width * 0.9015885, size.height * 0.09964238),
        size.width * 0.009523802, paint6Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
