import 'package:flutter/material.dart';

class ProfileEditBg extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff0C9D01).withOpacity(0.15);
    canvas.drawCircle(Offset(size.width * 0.3921884, size.height * 0.3521120),
        size.width * 0.1769065, paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffFF7E00).withOpacity(0.15);
    canvas.drawCircle(Offset(size.width * 0.9441353, size.height * 0.7816923),
        size.width * 0.1096821, paint1Fill);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff0C9D01).withOpacity(0.15);
    canvas.drawCircle(Offset(size.width * 0.7424638, size.height * 0.2746505),
        size.width * 0.02476691, paint2Fill);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xffFF7E00).withOpacity(0.15);
    canvas.drawCircle(Offset(size.width * 0.5690942, size.height * 0.7535192),
        size.width * 0.02476691, paint3Fill);

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xffFF7E00).withOpacity(0.15);
    canvas.drawCircle(
        Offset(size.width * -0.01469684, size.height * 0.09859279),
        size.width * 0.04599565,
        paint4Fill);

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xffFF7E00).withOpacity(0.15);
    canvas.drawCircle(Offset(size.width * 0.8450676, size.height * 0.1056322),
        size.width * 0.01061440, paint5Fill);

    Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = const Color(0xff0C9D01).withOpacity(0.15);
    canvas.drawCircle(Offset(size.width * 0.9441353, size.height * 0.1267596),
        size.width * 0.01061440, paint6Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
