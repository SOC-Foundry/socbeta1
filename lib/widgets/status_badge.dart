import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class StatusBadge extends StatelessWidget {
  final String label;
  final Color color;
  final bool isGlowing;

  const StatusBadge({
    super.key,
    required this.label,
    required this.color,
    this.isGlowing = false,
  });

  const StatusBadge.success({
    super.key,
    required this.label,
    this.isGlowing = false,
  }) : color = AppColors.success;

  const StatusBadge.warning({
    super.key,
    required this.label,
    this.isGlowing = false,
  }) : color = AppColors.warning;

  const StatusBadge.error({
    super.key,
    required this.label,
    this.isGlowing = true, // Critical usually glows
  }) : color = AppColors.error;

  const StatusBadge.neutral({
    super.key,
    required this.label,
    this.isGlowing = false,
  }) : color = AppColors.textSecondary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
        ),
        boxShadow: isGlowing
            ? [
                BoxShadow(
                  color: color.withValues(alpha: 0.2),
                  blurRadius: 8,
                  spreadRadius: 0,
                )
              ]
            : [],
      ),
      child: Text(
        label.toUpperCase(),
        style: GoogleFonts.jetBrainsMono(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: color,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
