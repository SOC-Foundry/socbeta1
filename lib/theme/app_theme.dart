import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  // Brand Colors
  static const Color background = Color(0xFF000000); // Vercel Black
  static const Color surface = Color(0xFF111111); // Dark Gray Surface
  static const Color border = Color(0xFF333333); // 1px Border Gray
  static const Color borderHighlight = Color(0xFF444444); // Hover Border

  // Accents
  static const Color primary = Color(0xFF0070F3); // Vercel Blue
  static const Color secondary = Color(0xFF7928CA); // Vercel Purple
  static const Color success = Color(0xFF00E5FF); // Cyan / Success (Scanner.dev feel)
  static const Color error = Color(0xFFFF0055); // Red / Error
  static const Color warning = Color(0xFFF5A623); // Amber / Warning

  // Text
  static const Color textPrimary = Color(0xFFEDEDED); // High Contrast Text
  static const Color textSecondary = Color(0xFFA1A1A1); // Muted Text
  static const Color textCode = Color(0xFF00E5FF); // Code Cyan

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient glowGradient = LinearGradient(
    colors: [Color(0xFF00E5FF), Color(0xFF7928CA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppTheme {
  static ThemeData get darkTheme {
    final baseTextTheme = ThemeData.dark().textTheme;
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      
      // Color Scheme
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.success,
        surface: AppColors.surface,
        error: AppColors.error,
        onSurface: AppColors.textPrimary,
      ),

      // Text Theme
      textTheme: GoogleFonts.interTextTheme(baseTextTheme).copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 48,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.5,
          color: AppColors.textPrimary,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          letterSpacing: -1.0,
          color: AppColors.textPrimary,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
          color: AppColors.textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        labelLarge: GoogleFonts.jetBrainsMono(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.5,
        ),
      ),



      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
      ),

      // Icon Theme
      iconTheme: const IconThemeData(
        color: AppColors.textSecondary,
        size: 20,
      ),
    );
  }
}
