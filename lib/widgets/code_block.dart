import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class CodeBlock extends StatelessWidget {
  final String code;
  final String? label;
  final Color? accentColor;

  const CodeBlock({
    super.key,
    required this.code,
    this.label,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: accentColor?.withValues(alpha: 0.3) ?? AppColors.border,
        ),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (label != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: accentColor?.withValues(alpha: 0.3) ?? AppColors.border,
                  ),
                ),
                color: accentColor?.withValues(alpha: 0.05),
              ),
              child: Text(
                label!,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 12,
                  color: accentColor ?? AppColors.textSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SelectableText(
              code,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 13,
                color: AppColors.textCode,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
