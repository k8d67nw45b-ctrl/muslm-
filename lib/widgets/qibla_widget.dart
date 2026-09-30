import 'package:flutter/material.dart';
import '../core/constants.dart';

class QiblaWidget extends StatefulWidget {
  const QiblaWidget({Key? key}) : super(key: key);

  @override
  State<QiblaWidget> createState() => _QiblaWidgetState();
}

class _QiblaWidgetState extends State<QiblaWidget> {
  double qiblaDirection = 45.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'اتجاه القبلة',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: kPaddingLarge),
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kGreen, width: 3),
              color: kCardBackground,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Compass circle
                CustomPaint(
                  size: const Size(250, 250),
                  painter: CompassPainter(),
                ),
                // Arrow pointing to Qibla
                Transform.rotate(
                  angle: qiblaDirection * 3.14159 / 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        color: kGreen,
                        size: 40,
                      ),
                      const Text(
                        'القبلة',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: kPaddingLarge),
          Text(
            '${qiblaDirection.toStringAsFixed(1)}°',
            style: const TextStyle(
              color: kGreen,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class CompassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white30
      ..strokeWidth = 1;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw circle
    canvas.drawCircle(center, radius, paint);

    // Draw cardinal directions
    const directions = ['N', 'E', 'S', 'W'];
    for (int i = 0; i < 4; i++) {
      final angle = i * 1.5708; // 90 degrees in radians
      final x = center.dx + radius * 0.85 * (angle == 0 ? 0 : (i == 1 ? 1 : (i == 3 ? -1 : 0)));
      final y = center.dy + radius * 0.85 * (angle == 0 ? -1 : (i == 2 ? 1 : 0));
    }
  }

  @override
  bool shouldRepaint(CompassPainter oldDelegate) => false;
}