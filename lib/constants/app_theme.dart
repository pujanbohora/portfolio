import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF121212),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.montserrat(
          fontSize: 72,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFE0E0E0),
        ),
        displayMedium: GoogleFonts.montserrat(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFE0E0E0),
        ),
        displaySmall: GoogleFonts.montserrat(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFE0E0E0),
        ),
        headlineMedium: GoogleFonts.montserrat(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFE0E0E0),
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 18,
          color: const Color(0xFFE0E0E0),
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 16,
          color: const Color(0xFFE0E0E0),
        ),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF00E5FF),
        secondary: Color(0xFF4FC3F7),
        tertiary: Color(0xFFFF4081),
        background: Color(0xFF121212),
        surface: Color(0xFF1E1E1E),
      ),
    );
  }
}
