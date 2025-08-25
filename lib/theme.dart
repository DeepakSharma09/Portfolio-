import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primary = Color(0xFF265DFF); // bluish tone (Trapigo-ish)
  static const onPrimary = Colors.white;
  static const bg = Color(0xFF0E1116); // deep slate
  static const surface = Color(0xFF171B22); // card bg
  static const textPrimary = Color(0xFFE6EAF2);
  static const textMuted = Color(0xFF9AA4B2);
  static const accent = Color(0xFFFFC857);

  static ThemeData theme() {
    final base = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        onPrimary: onPrimary,
        surface: bg,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: bg,
      useMaterial3: true,
    );

    return base.copyWith(
      textTheme: GoogleFonts.montserratTextTheme(base.textTheme).apply(
        bodyColor: textPrimary,
        displayColor: textPrimary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }
}
