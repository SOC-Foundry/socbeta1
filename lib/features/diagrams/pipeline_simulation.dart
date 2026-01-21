import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import '../../widgets/tech_card.dart';

class PipelineSimulation extends StatefulWidget {
  const PipelineSimulation({super.key});

  @override
  State<PipelineSimulation> createState() => _PipelineSimulationState();
}

class _PipelineSimulationState extends State<PipelineSimulation> {
  // Simulation phases
  bool _showIngest = false;
  bool _showFanout = false;
  bool _showProcessing = false;
  bool _showOutput = false;

  @override
  void initState() {
    super.initState();
    _startLoop();
  }

  void _startLoop() async {
    while (mounted) {
      if (!mounted) return;
      setState(() { _showIngest = true; _showFanout = false; _showProcessing = false; _showOutput = false; });
      await Future<void>.delayed(const Duration(milliseconds: 1500));
      
      if (!mounted) return;
      setState(() { _showFanout = true; });
      await Future<void>.delayed(const Duration(milliseconds: 1000));
      
      if (!mounted) return;
      setState(() { _showProcessing = true; });
      await Future<void>.delayed(const Duration(milliseconds: 2000));
      
      if (!mounted) return;
      setState(() { _showOutput = true; });
      await Future<void>.delayed(const Duration(milliseconds: 2000));

      // Reset
      if (!mounted) return;
      setState(() { _showIngest = false; _showFanout = false; _showProcessing = false; _showOutput = false; });
      await Future<void>.delayed(const Duration(milliseconds: 500));
    }
  }

  @override
  Widget build(BuildContext context) {
    return TechCard(
      title: 'SOC Alpha1 Pipeline',
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
        ),
        child: Stack(
          children: [
            // Nodes
            Positioned(top: 40, left: 0, right: 0, child: Center(child: SizedBox(width: 200, child: _buildNode('Panther SIEM', isActive: _showIngest)))),
            
            Positioned(top: 120, left: 0, right: 0, child: Center(child: SizedBox(width: 120, child: _buildNode('Pub/Sub', isActive: _showFanout, isCircle: true)))),
            
            // Agents Row
            Positioned(top: 220, left: 24, right: 24, child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _buildNode('Goose Agent', isActive: _showProcessing, color: AppColors.success)),
                const SizedBox(width: 8),
                Expanded(child: _buildNode('RAG Agent', isActive: _showProcessing, color: AppColors.success)),
                const SizedBox(width: 8),
                Expanded(child: _buildNode('Config Agent', isActive: _showProcessing, color: AppColors.success)),
                const SizedBox(width: 8),
                Expanded(child: _buildNode('Anomaly Agent', isActive: _showProcessing, color: AppColors.success)),
              ],
            )),

            Positioned(top: 320, left: 0, right: 0, child: Center(child: SizedBox(width: 200, child: _buildNode('Tines SOAR', isActive: _showOutput, color: AppColors.secondary)))),

            // Particles logic can be complex in generic stacks without fixed geometry. 
            // For now simplified visuals: glowing paths or just node activation is sufficient for Vercel "vibe" without complex path calculations.
            // I'll stick to node activation state for MVP as path coordinates depend on screen width which is responsive.
            // To make it truly responsive, LayoutBuilder would be needed, but sticking to centered layout helps.
          ],
        ),
      ),
    );
  }

  Widget _buildNode(String label, {bool isActive = false, bool isCircle = false, Color? color}) {
    final activeColor = color ?? AppColors.primary;
    return AnimatedContainer(
      duration: 300.ms,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isActive ? activeColor.withValues(alpha: 0.2) : AppColors.surface,
        borderRadius: BorderRadius.circular(isCircle ? 50 : 8),
        border: Border.all(
          color: isActive ? activeColor : AppColors.border,
          width: isActive ? 2 : 1,
        ),
        boxShadow: isActive ? [BoxShadow(color: activeColor.withValues(alpha: 0.3), blurRadius: 10)] : [],
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 12,
            color: isActive ? Colors.white : AppColors.textSecondary,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
