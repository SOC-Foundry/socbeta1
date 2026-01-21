import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/diagrams/pipeline_simulation.dart';
import 'features/diagrams/fanout_visualization.dart';
import 'widgets/tech_card.dart';
import 'theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHero(context),
                const SizedBox(height: 100),

                // Problem & Solution
                TechCard(
                  title: 'Signals Over Noise',
                  isHoverable: true,
                  child: Text(
                    'In 2025 no SIEM should be generating alerts from single log source detections. This not only creates an abundance of noisy alerts, but these alerts on their own bear no relevance to the other systems within your environments.\n\nWe convert your single log source alerts into signals, then craft adversary specific correlation rules using these signals with table joins from multiple log sources in your SIEM.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1, end: 0),
                
                const SizedBox(height: 80),

                // Agentic AI Section
                _buildSectionHeader('Autonomous Security Operations'),
                const SizedBox(height: 32),
                // Interactive Pipeline Simulation
                const PipelineSimulation(), 
                const SizedBox(height: 32),
                TechCard(
                  title: 'Agentic AI Systems',
                  child: Text(
                    'We help customers build agentic AI systems as alert destinations for all of their SIEM traffic. Rather than consuming expensive MCP tokens, paying for expensive vibe coded B2B SaaS garbage or exposing your sensitive traffic to the internet, we design and implement Sagemaker systems in AWS and Vertex in GCP.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                ),

                const SizedBox(height: 100),

                // SIEM Fanout Section
                _buildSectionHeader('Resilient Architecture'),
                const SizedBox(height: 32),
                const FanoutVisualization(),
                const SizedBox(height: 32),
                TechCard(
                  title: 'Modern Log Ingestion',
                  child: Text(
                    'Next generation SIEM platforms are all moving to an S3 log ingestion model, with single schema (ECS or OCSF) being applied on write to the data to increase query and indexing performance. We have designed a resilient and secure process using customer owned SNS Topics.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                ),

                const SizedBox(height: 120),
                _buildFooter(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 1,
          color: AppColors.primary,
        ),
        const SizedBox(width: 12),
        Text(
          title.toUpperCase(),
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildHero(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 120, // Slightly smaller for minimalist feel
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'SOC FOUNDRY',
          textAlign: TextAlign.center,
          style: GoogleFonts.orbitron(
            fontSize: 64,
            fontWeight: FontWeight.w900,
            letterSpacing: -2,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Next-Gen SIEM & Agentic AI Security',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 20,
            color: AppColors.textSecondary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 48),
        
        // Use a TechCard as a button wrapper for the "Call to Action" or standard button
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: Text(
                'SECURE YOUR INFRASTRUCTURE', 
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold, 
                  letterSpacing: 0.5,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    ).animate().fadeIn(duration: 1.seconds).slideY(begin: -0.1, end: 0);
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      children: [
        const Divider(color: AppColors.border),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '© 2025 SOC Foundry. All Rights Reserved.',
              style: GoogleFonts.inter(
                color: AppColors.textSecondary, 
                fontSize: 14
              ),
            ),
            Row(
              children: [
                _buildSocialIcon(FontAwesomeIcons.github),
                const SizedBox(width: 24),
                _buildSocialIcon(FontAwesomeIcons.twitter),
                const SizedBox(width: 24),
                _buildSocialIcon(FontAwesomeIcons.linkedin),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return FaIcon(
      icon, 
      size: 20, 
      color: AppColors.textSecondary
    );
  }
}
