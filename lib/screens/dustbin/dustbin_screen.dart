import 'dart:math';
import 'package:flutter/material.dart';

class DustbinScreen extends StatelessWidget {
  const DustbinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildArcContainer(10),
            const SizedBox(height: 20),
            const Text('80% Full', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            _buildDustbinBinLidSwitch(),
          ],
        ),
      ),
    );
  }

  Widget _buildArcContainer(double percentage) {
    return Container(
      width: 200,
      height: 100,
      padding: const EdgeInsets.all(20),
      child: CustomPaint(
        size: const Size(500, 500),
        painter: ArcPainter(percentage: percentage),
      ),
    );
  }

  Widget _buildDustbinBinLidSwitch() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dustbin Bin Lid', style: TextStyle(color: Colors.white)),
          Switch(
            value: true,
            onChanged: (value) {},
            activeColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  final double percentage;

  ArcPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width / 4;
    final double circleRadius = size.width - strokeWidth;
    const double sweepAngle = -1.3 * pi;
    const double startAngle = 0.5;

    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final circleCenter = Offset(size.width / 2, size.height / 2);
    final rectangle =
        Rect.fromCircle(center: circleCenter, radius: circleRadius);

    // Draw the primary red arc
    canvas.drawArc(rectangle, startAngle, sweepAngle, false, paint);

    const circleAngle = pi * 1.6 + sweepAngle;
    final revolveAngle = pi * (percentage / 50);
    final adjustedCircleAngle = circleAngle + revolveAngle;

    // Calculate the position of the revolving circle within the primary arc
    final circleX =
        circleCenter.dx + (circleRadius * cos(adjustedCircleAngle - pi * 1.8));
    final circleY =
        circleCenter.dy + (circleRadius * sin(adjustedCircleAngle - pi * 1.8));

    paint.color = Colors.blue;

    // Draw the revolving circle arc
    final circleRect =
        Rect.fromCircle(center: Offset(circleX, circleY), radius: 0.5);
    canvas.drawArc(circleRect, 0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
