import 'package:go_router/go_router.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'home_page.dart';
import 'features/downloads/downloads_page.dart';

final router = GoRouter(
  initialLocation: '/',
  observers: [
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/downloads',
      builder: (context, state) => const DownloadsPage(),
    ),
  ],
);
