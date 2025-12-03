import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final String content;
  final Widget? trailing;
  final bool isAccented;

  const SectionCard({
    super.key,
    required this.title,
    required this.content,
    this.trailing,
    this.isAccented = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF131927),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isAccented ? Colors.cyanAccent.withValues(alpha: 0.3) : Colors.white.withValues(alpha: 0.05),
          width: isAccented ? 2 : 1,
        ),
        boxShadow: isAccented
            ? [
                BoxShadow(
                  color: Colors.cyanAccent.withValues(alpha: 0.1),
                  blurRadius: 30,
                  spreadRadius: -5,
                )
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isAccented ? Colors.cyanAccent : Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.white70,
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(height: 24),
            trailing!,
          ],
        ],
      ),
    );
  }
}
