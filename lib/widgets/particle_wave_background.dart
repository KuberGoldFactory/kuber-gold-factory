import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../main.dart';

class ParticleWaveBackground extends StatefulWidget {
  final Widget child;
  const ParticleWaveBackground({super.key, required this.child});

  @override
  State<ParticleWaveBackground> createState() => _ParticleWaveBackgroundState();
}

class _ParticleWaveBackgroundState extends State<ParticleWaveBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: _WavePainter(
                  animationValue: _controller.value,
                  isDark: isDark,
                  primaryColor: AppColors.gold,
                ),
              );
            },
          ),
        ),
        widget.child,
      ],
    );
  }
}

class _WavePainter extends CustomPainter {
  final double animationValue;
  final bool isDark;
  final Color primaryColor;

  _WavePainter({
    required this.animationValue,
    required this.isDark,
    required this.primaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = primaryColor.withOpacity(isDark ? 0.05 : 0.08)
      ..style = PaintingStyle.fill;

    final path = Path();
    final yOffset = size.height * 0.7;
    final waveHeight = 40.0;
    final waveLength = size.width;

    path.moveTo(0, size.height);
    path.lineTo(0, yOffset);

    for (double i = 0; i <= size.width; i++) {
      path.lineTo(
        i,
        yOffset + math.sin((i / waveLength * 2 * math.pi) + (animationValue * 2 * math.pi)) * waveHeight,
      );
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);

    // Draw second wave with different phase
    final paint2 = Paint()
      ..color = primaryColor.withOpacity(isDark ? 0.03 : 0.05)
      ..style = PaintingStyle.fill;

    final path2 = Path();
    final yOffset2 = size.height * 0.75;
    
    path2.moveTo(0, size.height);
    path2.lineTo(0, yOffset2);

    for (double i = 0; i <= size.width; i++) {
        path2.lineTo(
            i,
            yOffset2 + math.cos((i / waveLength * 2 * math.pi) + (animationValue * 2 * math.pi)) * waveHeight,
        );
    }

    path2.lineTo(size.width, size.height);
    path2.close();

    canvas.drawPath(path2, paint2);

    // Draw particles
    final random = math.Random(42);
    for (int i = 0; i < 30; i++) {
      final x = random.nextDouble() * size.width;
      final yBase = random.nextDouble() * size.height;
      final y = yBase + math.sin(animationValue * 2 * math.pi + i) * 10;
      
      final particlePaint = Paint()
        ..color = primaryColor.withOpacity(isDark ? 0.1 : 0.15)
        ..style = PaintingStyle.fill;
      
      canvas.drawCircle(Offset(x, y), 1.5, particlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
