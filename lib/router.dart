import 'package:go_router/go_router.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'home_page.dart';
import 'features/downloads/downloads_page.dart';

final router = GoRouter(
  // initialLocation: '/', // Let the platform decide (browser URL)
  observers: [
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/installers',
      builder: (context, state) => const DownloadsPage(),
    ),
  ],
  redirect: (context, state) {
    // Normalize path by removing trailing slash if present
    final path = state.uri.path;
    if (path != '/' && path.endsWith('/')) {
      return path.substring(0, path.length - 1);
    }
    return null;
  },
);
