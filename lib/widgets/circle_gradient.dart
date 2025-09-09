import 'package:flutter/material.dart';
import 'dart:math';

class GradientCircularProgress extends StatelessWidget {
  final double percent;

  const GradientCircularProgress({super.key, required this.percent});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(220, 220),
            painter: _GradientCirclePainter(percent),
          ),
          Text(
            "${percent.toStringAsFixed(0)}%",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class _GradientCirclePainter extends CustomPainter {
  final double percent;

  _GradientCirclePainter(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 20;
    double radius = (size.width / 2) - strokeWidth;

    Offset center = Offset(size.width / 2, size.height / 2);

    // Background circle (with your faded purple)
    Paint backgroundPaint = Paint()
      ..color = const Color(0x2EB158FF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Gradient for progress arc
    final gradient = RadialGradient(
      colors: const [
        Color(0xFF8C59FF), // start
        Color(0xFF492699), // end
      ],
      center: const Alignment(-0.99, 0.0), // matches 0.1% 49.68%
      radius: 1.05,
    );

    final rect = Rect.fromCircle(center: center, radius: radius);

    Paint foregroundPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    double sweepAngle = 2 * pi * (percent / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
