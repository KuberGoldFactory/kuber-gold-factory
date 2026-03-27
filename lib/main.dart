import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/services_page.dart';
import 'pages/gold_rates_page.dart';
import 'pages/dealer_network_page.dart';
import 'pages/contact_page.dart';
import 'widgets/site_scaffold.dart';

void main() {
  runApp(const KuberGoldFactoryApp());
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => SiteScaffold(child: child),
      routes: [
        GoRoute(path: '/', builder: (c, s) => const HomePage()),
        GoRoute(path: '/about', builder: (c, s) => const AboutPage()),
        GoRoute(path: '/services', builder: (c, s) => const ServicesPage()),
        GoRoute(path: '/gold-rates', builder: (c, s) => const GoldRatesPage()),
        GoRoute(path: '/dealer-network', builder: (c, s) => const DealerNetworkPage()),
        GoRoute(path: '/contact', builder: (c, s) => const ContactPage()),
      ],
    ),
  ],
);

class KuberGoldFactoryApp extends StatelessWidget {
  const KuberGoldFactoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kuber Gold Factory',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.obsidian,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.gold,
          secondary: AppColors.goldLight,
          surface: AppColors.charcoal,
        ),
        // Use Heebo as the "Miligram Hero" substitute
        textTheme: GoogleFonts.heeboTextTheme(ThemeData.dark().textTheme).copyWith(
          displayLarge: GoogleFonts.heebo(fontWeight: FontWeight.w900),
          headlineLarge: GoogleFonts.heebo(fontWeight: FontWeight.w800),
          titleLarge: GoogleFonts.heebo(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class AppColors {
  static const Color obsidian = Color(0xFF080808);
  static const Color charcoal = Color(0xFF111111);
  static const Color darkCard = Color(0xFF191919);
  static const Color gold = Color(0xFFD4AF37);
  static const Color goldLight = Color(0xFFE8CC6A);
  static const Color goldDark = Color(0xFFAA8A1D);
  static const Color ivory = Color(0xFFF5F0E8);
  static const Color textMain = Color(0xFFE0E0E0);
  static const Color textMuted = Color(0xFF888888);
  static const Color divider = Color(0xFF2A2A2A);

  // Semantic Colors from Miligram
  static const Color success = Color(0xFF4CAF50); // Green
  static const Color debt = Color(0xFF2196F3);    // Blue
  static const Color credit = Color(0xFFF44336);  // Red
}
