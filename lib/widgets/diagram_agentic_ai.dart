import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AgenticAiDiagram extends StatelessWidget {
  const AgenticAiDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Text(
              'Agentic AI System Architecture',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.cyanAccent),
            ),
          ),
          const SizedBox(height: 32),
          
          // EXTERNAL
          _buildSectionLabel('EXTERNAL SOURCES'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNode('Scanner SIEM', FontAwesomeIcons.magnifyingGlass, Colors.orange),
              _buildNode('TAXII2 Threat Feeds', FontAwesomeIcons.shieldVirus, Colors.redAccent),
            ],
          ),
          _buildDownArrow(),

          // INGESTION
          _buildSectionLabel('INGESTION LAYER (GCP)'),
          const SizedBox(height: 16),
          _buildNode('Pub/Sub Topic\npanther-alerts-dev', FontAwesomeIcons.cloudArrowDown, Colors.blue),
          _buildDownArrow(label: 'Fan-out'),

          // PROCESSING
          _buildSectionLabel('PROCESSING LAYER - PRIVATE VPC'),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              // On mobile, wrap. On desktop, row.
              return Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildAgentNode('Goose Agent', 'Rule Logic', FontAwesomeIcons.robot),
                  _buildAgentNode('RAG Agent', 'Context', FontAwesomeIcons.book),
                  _buildAgentNode('Config Agent', 'Change Detection', FontAwesomeIcons.gears),
                  _buildAgentNode('Anomaly Agent', 'Stat Outliers', FontAwesomeIcons.chartLine),
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          
          // AI SERVICES (Sub-layer)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple.withValues(alpha: 0.3), style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const Text('ML/AI & Data Services (Vertex AI & BigQuery)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSmallNode('DeepSeek LLM'),
                    _buildSmallNode('Vector DB'),
                    _buildSmallNode('Anomaly Model'),
                  ],
                ),
              ],
            ),
          ),
          _buildDownArrow(),

          // ORCHESTRATION
          _buildSectionLabel('ORCHESTRATION'),
          const SizedBox(height: 16),
          Center(child: _buildNode('Cloud Workflows\nDecision Engine', FontAwesomeIcons.diagramProject, Colors.purpleAccent)),
          _buildDownArrow(),

          // OUTPUTS
          _buildSectionLabel('OUTPUTS'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNode('BigQuery\nHistory', FontAwesomeIcons.database, Colors.blueGrey),
              _buildNode('Tines SOAR', FontAwesomeIcons.bolt, Colors.orangeAccent),
              _buildNode('Slack Alerts', FontAwesomeIcons.slack, Colors.purple),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(String text) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.bold, color: Colors.white70),
        ),
      ),
    );
  }

  Widget _buildNode(String text, IconData icon, Color color) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F2C),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.1), blurRadius: 10, spreadRadius: 1),
        ],
      ),
      child: Column(
        children: [
          FaIcon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).scale();
  }

  Widget _buildAgentNode(String title, String subtitle, IconData icon) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.green.withValues(alpha: 0.2), Colors.green.withValues(alpha: 0.05)],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          FaIcon(icon, color: Colors.greenAccent, size: 20),
          const SizedBox(height: 8),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(fontSize: 9, color: Colors.white60)),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0);
  }

  Widget _buildSmallNode(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(fontSize: 10, color: Colors.white70)),
    );
  }

  Widget _buildDownArrow({String? label}) {
    return Column(
      children: [
        const SizedBox(height: 8),
        if (label != null) Text(label, style: const TextStyle(fontSize: 9, color: Colors.white30)),
        const Icon(Icons.keyboard_arrow_down, color: Colors.white24),
        const SizedBox(height: 8),
      ],
    );
  }
}
