import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF121212);
  static const Color text = Color(0xFFE0E0E0);
  static const Color primaryAccent = Color(0xFF00E5FF);
  static const Color secondaryAccent = Color(0xFF4FC3F7);
  static const Color highlight = Color(0xFFFF4081);
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryAccent, secondaryAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient darkGradient = LinearGradient(
    colors: [background, Color(0xFF1E1E1E)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
