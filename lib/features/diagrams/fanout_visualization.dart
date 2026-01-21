import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import '../../widgets/tech_card.dart';

class FanoutVisualization extends StatefulWidget {
  const FanoutVisualization({super.key});

  @override
  State<FanoutVisualization> createState() => _FanoutVisualizationState();
}

class _FanoutVisualizationState extends State<FanoutVisualization> {
  String? _hoveredSource;

  final Map<String, Color> _sourceColors = {
    'VPC Flow Logs': Colors.blue,
    'Sublime': Colors.orange,
    'Cloudflare': Colors.orangeAccent,
    'Okta': Colors.pinkAccent,
  };

  @override
  Widget build(BuildContext context) {
    return TechCard(
      title: 'SIEM Fan-out Architecture',
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            // Sources Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _sourceColors.keys.map((source) => _buildSourceNode(source)).toList(),
            ),
            const SizedBox(height: 48),
            
            // SNS Topic
            _buildCentralNode('SNS Topic: siem-eval-topic'),
            
            const SizedBox(height: 48),

            // Queues & SIEMs
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildSiemColumn('Panther', ['vpc-panther', 'sublime-panther', 'cf-panther', 'okta-panther'])),
                Expanded(child: _buildSiemColumn('Scanner.dev', ['vpc-scanner', 'sublime-scanner', 'cf-scanner', 'okta-scanner'])),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSourceNode(String label) {
    final isHovered = _hoveredSource == label;
    final color = _sourceColors[label]!;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredSource = label),
      onExit: (_) => setState(() => _hoveredSource = null),
      child: AnimatedContainer(
        duration: 200.ms,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isHovered ? color.withValues(alpha: 0.2) : AppColors.surface,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: isHovered ? color : AppColors.border),
          boxShadow: isHovered ? [BoxShadow(color: color.withValues(alpha: 0.3), blurRadius: 10)] : [],
        ),
        child: Text(
          label,
          style: GoogleFonts.jetBrainsMono(
            color: isHovered ? Colors.white : AppColors.textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCentralNode(String label) {
    final isActive = _hoveredSource != null;
    return AnimatedContainer(
      duration: 300.ms,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isActive ? AppColors.secondary.withValues(alpha: 0.2) : AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isActive ? AppColors.secondary : AppColors.border),
      ),
      child: Column(
        children: [
          const Icon(Icons.hub, color: AppColors.secondary),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.jetBrainsMono(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildSiemColumn(String siemName, List<String> queues) {
    final isActive = _hoveredSource != null;
    // Simple logic: if any source is hovered, highlight connections to both SIEMs (fanout principle)
    
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: isActive ? AppColors.primary : AppColors.border),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.security, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 8),
              Text(siemName, style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
        ),
        ...queues.map((q) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            '↓ $q', 
            style: GoogleFonts.jetBrainsMono(fontSize: 10, color: AppColors.textSecondary),
          ),
        )),
      ],
    );
  }
}
