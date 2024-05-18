import 'package:flutter/material.dart';

class CustomButtonPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.3023846);
    path.cubicTo(
        0,
        size.height * 0.1557810,
        size.width * 0.01833952,
        size.height * 0.03616885,
        size.width * 0.04136707,
        size.height * 0.03350058);
    path.cubicTo(
        size.width * 0.1314266,
        size.height * 0.02306500,
        size.width * 0.3493595,
        size.height * -0.0001902035,
        size.width * 0.5015106,
        0);
    path.cubicTo(
        size.width * 0.6523172,
        size.height * 0.0001885227,
        size.width * 0.8689003,
        size.height * 0.02320038,
        size.width * 0.9586344,
        size.height * 0.03353442);
    path.cubicTo(size.width * 0.9816647, size.height * 0.03618654, size.width,
        size.height * 0.1558062, size.width, size.height * 0.3024269);
    path.lineTo(size.width, size.height * 0.6975731);
    path.cubicTo(
        size.width,
        size.height * 0.8441923,
        size.width * 0.9816647,
        size.height * 0.9638115,
        size.width * 0.9586344,
        size.height * 0.9664635);
    path.cubicTo(
        size.width * 0.8689003,
        size.height * 0.9767981,
        size.width * 0.6523172,
        size.height * 0.9998115,
        size.width * 0.5015106,
        size.height);
    path.cubicTo(
        size.width * 0.3493595,
        size.height * 1.000190,
        size.width * 0.1314266,
        size.height * 0.9769346,
        size.width * 0.04136707,
        size.height * 0.9664981);
    path.cubicTo(size.width * 0.01833949, size.height * 0.9638288, 0,
        size.height * 0.8442173, 0, size.height * 0.6976135);
    path.lineTo(0, size.height * 0.3023846);
    path.close();

    Paint fill = Paint()..style = PaintingStyle.fill;
    fill.color = const Color(0xff5F33E1).withOpacity(1.0);
    canvas.drawPath(path, fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
