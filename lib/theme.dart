import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Modern Luxury Color Palette
  static const Color primaryRed = Color(0xFFB71C1C); 
  static const Color accentRed = Color(0xFFD32F2F);
  static const Color backgroundWhite = Color(0xFFFAFAFA); 
  static const Color matteBlack = Color(0xFF1A1A1A);
  static const Color glassWhite = Color(0xCCFFFFFF);
  
  // Backward compatibility aliases
  static const Color pureWhite = Colors.white;
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color secondaryBlack = Color(0xFF2D2D2D);

  static ThemeData get modern {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryRed,
        primary: primaryRed,
        secondary: matteBlack,
        surface: backgroundWhite,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: backgroundWhite,
      
      textTheme: TextTheme(
        displayLarge: GoogleFonts.playfairDisplay(
          fontSize: 32,
          fontWeight: FontWeight.w900,
          color: matteBlack,
          letterSpacing: -0.5,
        ),
        headlineLarge: GoogleFonts.playfairDisplay(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: matteBlack,
        ),
        headlineMedium: GoogleFonts.outfit(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: matteBlack,
        ),
        bodyLarge: GoogleFonts.outfit(
          fontSize: 16,
          color: matteBlack,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.outfit(
          fontSize: 14,
          color: Colors.grey[800],
        ),
        labelLarge: GoogleFonts.outfit(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: primaryRed,
        ),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: backgroundWhite,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.playfairDisplay(
          color: matteBlack,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: matteBlack, size: 24),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: matteBlack,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          textStyle: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Color(0xFFEEEEEE)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: primaryRed, width: 2),
        ),
        labelStyle: GoogleFonts.outfit(color: Colors.grey[600]),
      ),
      
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  static ThemeData get light => modern;
}
