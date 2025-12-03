import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SiemFanoutDiagram extends StatelessWidget {
  const SiemFanoutDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 800;
          return isWide ? _buildWideLayout() : _buildNarrowLayout();
        },
      ),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SOURCES
        Expanded(
          flex: 2,
          child: Column(
            children: [
              _buildHeader('Log Sources'),
              const SizedBox(height: 16),
              _buildSourceRow('VPC Flow', 'S3 Bucket (SSE-S3)', Colors.blue),
              const SizedBox(height: 8),
              _buildSourceRow('Sublime', 'S3 Bucket (SSE-S3)', Colors.green),
              const SizedBox(height: 8),
              _buildSourceRow('Cloudflare', 'S3 Bucket (SSE-S3)', Colors.orange),
              const SizedBox(height: 8),
              _buildSourceRow('Okta', 'S3 Bucket (SSE-S3)', Colors.purple),
            ],
          ),
        ),
        
        // ARROW TO SNS
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(Icons.arrow_forward, color: Colors.white24),
        ),

        // SNS
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeader('Aggregation'),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFD86613).withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFD86613)),
                ),
                child: const FaIcon(FontAwesomeIcons.bullhorn, color: Color(0xFFD86613), size: 32),
              ),
              const SizedBox(height: 8),
              const Text('SNS Topic', style: TextStyle(fontWeight: FontWeight.bold)),
              const Text('Fan-out', style: TextStyle(fontSize: 10, color: Colors.white54)),
            ],
          ),
        ),

        // ARROW TO QUEUES
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(Icons.arrow_forward, color: Colors.white24),
        ),

        // QUEUES & SIEMS
        Expanded(
          flex: 3,
          child: Column(
            children: [
              _buildHeader('Delivery & Ingestion'),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                         _buildQueueStack('Panther Queues', 4),
                         const Icon(Icons.arrow_downward, color: Colors.white24, size: 16),
                         _buildSiemNode('Panther SIEM', FontAwesomeIcons.shieldHalved, Colors.indigo),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                         _buildQueueStack('Scanner Queues', 4),
                         const Icon(Icons.arrow_downward, color: Colors.white24, size: 16),
                         _buildSiemNode('Scanner.dev', FontAwesomeIcons.magnifyingGlass, Colors.teal),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return Column(
      children: [
        _buildHeader('Log Sources & Buckets'),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
             _buildChip('VPC', Colors.blue),
             _buildChip('Sublime', Colors.green),
             _buildChip('Cloudflare', Colors.orange),
             _buildChip('Okta', Colors.purple),
          ],
        ),
        const SizedBox(height: 16),
        const Icon(Icons.arrow_downward, color: Colors.white24),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFD86613).withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFD86613)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
               FaIcon(FontAwesomeIcons.bullhorn, color: Color(0xFFD86613)),
               SizedBox(width: 12),
               Text('SNS Fan-out Topic', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Icon(Icons.arrow_downward, color: Colors.white24),
        const SizedBox(height: 16),
        _buildHeader('Parallel SQS Delivery'),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                _buildQueueStack('Panther Qs', 4),
                const SizedBox(height: 8),
                _buildSiemNode('Panther', FontAwesomeIcons.shieldHalved, Colors.indigo),
              ],
            ),
             Column(
              children: [
                _buildQueueStack('Scanner Qs', 4),
                const SizedBox(height: 8),
                _buildSiemNode('Scanner', FontAwesomeIcons.magnifyingGlass, Colors.teal),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader(String text) {
    return Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white54, letterSpacing: 1));
  }

  Widget _buildSourceRow(String name, String bucket, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F2C),
        border: Border(left: BorderSide(color: color, width: 4)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          Text(bucket, style: const TextStyle(fontSize: 10, color: Colors.white38)),
        ],
      ),
    ).animate().slideX();
  }
  
  Widget _buildChip(String label, Color color) {
     return Chip(
       label: Text(label, style: const TextStyle(fontSize: 10)), 
       backgroundColor: color.withValues(alpha: 0.2),
       side: BorderSide(color: color),
     );
  }

  Widget _buildQueueStack(String label, int count) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFF4F8B).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFFF4F8B).withValues(alpha: 0.5)),
      ),
      child: Column(
        children: [
          const FaIcon(FontAwesomeIcons.layerGroup, color: Color(0xFFFF4F8B), size: 20),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildSiemNode(String name, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF232F3E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
         boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.2), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          FaIcon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const Text('TLS 1.3', style: TextStyle(fontSize: 9, color: Colors.greenAccent)),
        ],
      ),
    ).animate().fadeIn().scale();
  }
}
