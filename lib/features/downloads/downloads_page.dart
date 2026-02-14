import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme/app_theme.dart';

class DownloadItem {
  final String name;
  final String version;
  final String filename;
  final String description;
  final bool isNew;

  const DownloadItem({
    required this.name,
    required this.version,
    required this.filename,
    required this.description,
    this.isNew = false,
  });
}

class DownloadsPage extends ConsumerWidget {
  const DownloadsPage({super.key});

  final List<DownloadItem> _items = const [
    DownloadItem(
      name: 'Falcon Sensor (Stable)',
      version: '7.32.0-18504',
      filename: 'falcon-sensor_7.32.0-18504_amd64.deb',
      description: 'Stable release for production environments.',
    ),
    DownloadItem(
      name: 'Falcon Sensor (Beta)',
      version: '7.34.0-18708',
      filename: 'falcon-sensor_7.34.0-18708_amd64.deb',
      description: 'Latest beta release with new features.',
      isNew: true,
    ),
  ];

  Future<void> _downloadFile(DownloadItem item) async {
    // 1. Log Analytics Event
    await FirebaseAnalytics.instance.logEvent(
      name: 'file_download',
      parameters: {
        'file_name': item.filename,
        'file_version': item.version,
      },
    );

    // 2. Launch URL
    final uri = Uri.parse('/downloads/${item.filename}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Downloads', style: AppTheme.darkTheme.textTheme.headlineSmall),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available Packages',
                style: AppTheme.darkTheme.textTheme.displayMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Select a package to download. Downloads are tracked for analytics.',
                style: AppTheme.darkTheme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: _items.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return _buildDownloadCard(context, item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDownloadCard(BuildContext context, DownloadItem item) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: FaIcon(FontAwesomeIcons.linux, color: AppColors.primary),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item.name,
                      style: AppTheme.darkTheme.textTheme.titleLarge?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (item.isNew) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.success.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.success.withValues(alpha: 0.5)),
                        ),
                        child: Text(
                          'NEW',
                          style: AppTheme.darkTheme.textTheme.labelSmall?.copyWith(
                            color: AppColors.success,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item.version,
                  style: AppTheme.darkTheme.textTheme.bodyMedium?.copyWith(
                    fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.description,
                  style: AppTheme.darkTheme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton.icon(
            onPressed: () => _downloadFile(item),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.textPrimary,
              foregroundColor: AppColors.background,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: const Icon(Icons.download_rounded, size: 20),
            label: const Text('Download'),
          ),
        ],
      ),
    );
  }
}
