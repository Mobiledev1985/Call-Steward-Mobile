import 'package:flutter/material.dart';

class HalfCircle extends StatelessWidget {
  /// Authentication UI top half circle
  const HalfCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        MediaQuery.of(context).size.width,
        (MediaQuery.of(context).size.width * 0.4300847457627119).toDouble(),
      ),
      painter: HalfCircleCustomPainter(),
    );
  }
}

class HalfCircleCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4577617, size.height * 0.9966478);
    path_0.cubicTo(
        size.width * 0.2796610,
        size.height * 0.9581281,
        size.width * 0.08764523,
        size.height * 0.7449212,
        0,
        size.height * 0.6221355);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.6221355);
    path_0.cubicTo(
        size.width * 0.7469905,
        size.height * 0.9660961,
        size.width * 0.5330869,
        size.height * 1.015128,
        size.width * 0.4577617,
        size.height * 0.9966478);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff0E1E2B).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
