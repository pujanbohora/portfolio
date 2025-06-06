import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pujan_portfolio/constants/app_colors.dart';
// import 'package:portfolio/constants/app_colors.dart' show AppColors;

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.background,
                AppColors.background.withBlue(40),
              ],
            ),
          ),
        ),
        _buildParticles(),
        _buildGrid(),
      ],
    );
  }
  
  Widget _buildParticles() {
    return Stack(
      children: List.generate(
        30,
        (index) => Positioned(
          left: (index * 17) % 400,
          top: (index * 23) % 300,
          child: Container(
            width: 3,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.primaryAccent.withOpacity(0.6),
              borderRadius: BorderRadius.circular(1.5),
            ),
          ).animate(
            onPlay: (controller) => controller.repeat(),
          ).scale(
            begin: const Offset(1, 1),
            end: const Offset(1.5, 1.5),
            duration: Duration(milliseconds: 1000 + (index * 100) % 1000),
          ).then().scale(
            begin: const Offset(1.5, 1.5),
            end: const Offset(1, 1),
            duration: Duration(milliseconds: 1000 + (index * 100) % 1000),
          ),
        ),
      ),
    );
  }
  
  Widget _buildGrid() {
    return CustomPaint(
      size: const Size(double.infinity, double.infinity),
      painter: GridPainter(),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryAccent.withOpacity(0.1)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;
    
    const spacing = 40.0;
    
    for (var i = 0.0; i < size.width; i += spacing) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, size.height),
        paint,
      );
    }
    
    for (var i = 0.0; i < size.height; i += spacing) {
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width, i),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
