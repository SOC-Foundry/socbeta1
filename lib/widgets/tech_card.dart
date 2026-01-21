import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TechCard extends StatefulWidget {
  final Widget child;
  final String? title;
  final VoidCallback? onTap;
  final bool isHoverable;
  final EdgeInsetsGeometry padding;
  final double? height;
  final double? width;

  const TechCard({
    super.key,
    required this.child,
    this.title,
    this.onTap,
    this.isHoverable = true,
    this.padding = const EdgeInsets.all(24),
    this.height,
    this.width,
  });

  @override
  State<TechCard> createState() => _TechCardState();
}

class _TechCardState extends State<TechCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: (widget.isHoverable && _isHovering) 
                  ? AppColors.textPrimary.withValues(alpha: 0.5) 
                  : AppColors.border,
              width: 1,
            ),
            boxShadow: (widget.isHoverable && _isHovering)
                ? [
                    BoxShadow(
                      color: AppColors.textPrimary.withValues(alpha: 0.1),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          padding: widget.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.title != null) ...[
                Text(
                  widget.title!,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 18,
                    color: _isHovering ? AppColors.textPrimary : AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),
              ],
              widget.child,
            ],
          ),
        ),
      ),
    );
  }
}
