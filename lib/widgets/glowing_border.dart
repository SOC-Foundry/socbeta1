import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GlowingBorder extends StatelessWidget {
  final Widget child;
  final bool isGlowing;
  final Color? glowColor;

  const GlowingBorder({
    super.key,
    required this.child,
    this.isGlowing = true,
    this.glowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9), // 1px more than inner content usually
        gradient: isGlowing
            ? LinearGradient(
                colors: [
                  (glowColor ?? AppColors.primary).withValues(alpha: 0.5),
                  (glowColor ?? AppColors.secondary).withValues(alpha: 0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
      ),
      padding: const EdgeInsets.all(1), // The size of the border
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: child,
      ),
    );
  }
}
