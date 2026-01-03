import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/diagram_agentic_ai.dart';
import 'widgets/diagram_siem_fanout.dart';
import 'widgets/section_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.5,
                  colors: [
                    Color(0xFF0F172A),
                    Color(0xFF020408),
                  ],
                ),
              ),
            ),
          ),
          
          // Content
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHero(),
                    const SizedBox(height: 80),

                    // Problem & Solution
                    const SectionCard(
                      title: 'Signals Over Noise',
                      content: 'In 2025 no SIEM should be generating alerts from single log source detections. This not only creates an abundance of noisy alerts, but these alerts on their own bear no relevance to the other systems within your environments.\n\nWe convert your single log source alerts into signals, then craft adversary specific correlation rules using these signals with table joins from multiple log sources in your SIEM. This provides you with high fidelity, actionable alerts to detect malicious activity on your attack surface, and moving laterally within your systems.',
                      isAccented: true,
                    ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1, end: 0),
                    
                    const SizedBox(height: 64),

                    // Agentic AI Diagram & Text
                    const Text('Autonomous Security Operations', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white60)),
                    const SizedBox(height: 24),
                    const AgenticAiDiagram(),
                    const SizedBox(height: 32),
                    const SectionCard(
                      title: 'Agentic AI Systems',
                      content: 'We help customers build agentic AI systems as alert destinations for all of their SIEM traffic. Rather than consuming expensive MCP tokens, paying for expensive vibe coded B2B SaaS garbage or exposing your sensitive traffic to the internet, we design and implement Sagemaker systems in AWS and Vertex in GCP to provide customers with AI platforms they own and continually analyze their own alerts.\n\nCommon use cases are detecting Novel Anomalies and missing Change Control tags in configuration changes that may be Indications of Compromise (IoC).',
                    ),

                    const SizedBox(height: 80),

                    // SIEM Fanout Diagram & Text
                    const Text('Resilient Architecture', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white60)),
                    const SizedBox(height: 24),
                    const SiemFanoutDiagram(),
                    const SizedBox(height: 32),
                    const SectionCard(
                      title: 'Modern Log Ingestion',
                      content: 'Next generation SIEM platforms are all moving to an S3 log ingestion model, with single schema (ECS or OCSF) being applied on write to the data to increase query and indexing performance. Additionally, many Blue Teams are living in multiple SIEMs, and need a way to Fan-out event notifications from their buckets to multiple SIEMs with parallel processing.\n\nAs a result, companies can no longer rely on overly permissive CFTs to onboard their SIEM. We have designed a resilient and secure process using customer owned SNS Topics that all S3 log source buckets subscribe to, with SIEM independent SQS queues delivering secure SSE traffic into each SIEM.',
                    ),

                    const SizedBox(height: 100),
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHero() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 80,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 24),
        Text(
          'SOC FOUNDRY',
          textAlign: TextAlign.center,
          style: GoogleFonts.orbitron(
            fontSize: 56,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
            color: Colors.white,
            shadows: [
              Shadow(color: Colors.cyanAccent.withValues(alpha: 0.5), blurRadius: 20),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Next-Gen SIEM & Agentic AI Security',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 20,
            color: Colors.white70,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyanAccent,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 10,
            shadowColor: Colors.cyanAccent.withValues(alpha: 0.5),
          ),
          child: const Text('SECURE YOUR INFRASTRUCTURE', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
        ),
      ],
    ).animate().fadeIn(duration: 1.seconds).slideY(begin: -0.2, end: 0);
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Divider(color: Colors.white.withValues(alpha: 0.1)),
        const SizedBox(height: 24),
        const Text(
          '© 2025 SOC Foundry. All Rights Reserved.',
          style: TextStyle(color: Colors.white30),
        ),
        const SizedBox(height: 12),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.github, size: 20, color: Colors.white30),
            SizedBox(width: 24),
            FaIcon(FontAwesomeIcons.twitter, size: 20, color: Colors.white30),
            SizedBox(width: 24),
            FaIcon(FontAwesomeIcons.linkedin, size: 20, color: Colors.white30),
          ],
        )
      ],
    );
  }
}
