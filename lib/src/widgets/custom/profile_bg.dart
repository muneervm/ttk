import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ProfileBg extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.2620773,size.height*0.7967626);
    path_0.cubicTo(size.width*0.1780193,size.height*0.8039568,size.width*0.05152971,size.height*0.9340540,size.width*-0.001207729,size.height*0.9982014);
    path_0.lineTo(size.width*-0.001207729,size.height*-0.001798561);
    path_0.lineTo(size.width*1.001208,size.height*-0.001798561);
    path_0.lineTo(size.width*1.001208,size.height*0.8327338);
    path_0.cubicTo(size.width*0.9847029,size.height*0.8675072,size.width*0.9386473,size.height*0.9456835,size.width*0.8864734,size.height*0.9802158);
    path_0.cubicTo(size.width*0.8212560,size.height*1.023381,size.width*0.7028986,size.height*0.9532374,size.width*0.6159420,size.height*0.9136691);
    path_0.cubicTo(size.width*0.5289855,size.height*0.8741007,size.width*0.3671498,size.height*0.7877698,size.width*0.2620773,size.height*0.7967626);
    path_0.close();

    Paint paint0Fill = Paint()..style=PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(Offset(size.width*0.5000000,size.height*0.3165468), Offset(size.width*0.5000000,size.height*0.7320144), [Color(0xff0C9D01).withOpacity(1),Color(0xff0DB600).withOpacity(1)], [0,1]);
    canvas.drawPath(path_0,paint0Fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}