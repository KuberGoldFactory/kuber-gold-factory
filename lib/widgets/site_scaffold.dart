import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';

class SiteScaffold extends StatefulWidget {
  final Widget child;
  const SiteScaffold({super.key, required this.child});

  @override
  State<SiteScaffold> createState() => _SiteScaffoldState();
}

class _SiteScaffoldState extends State<SiteScaffold> {
  bool _menuOpen = false;

  static const _navItems = [
    ('Home', '/'),
    ('About', '/about'),
    ('Services', '/services'),
    ('Gold Rates', '/gold-rates'),
    ('Dealer Network', '/dealer-network'),
    ('Contact', '/contact'),
  ];

  @override
  Widget build(BuildContext context) {
    final loc = GoRouterState.of(context).uri.toString();
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      backgroundColor: AppColors.obsidian,
      body: Stack(
        children: [
          Column(
            children: [
              _buildNavBar(context, loc, isMobile),
              Expanded(child: widget.child),
            ],
          ),
          _buildFloatingWhatsApp(context),
          if (isMobile && _menuOpen) _buildMobileMenu(context, loc),
        ],
      ),
    );
  }

  Widget _buildNavBar(BuildContext context, String loc, bool isMobile) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, mode, child) {
        final isDark = mode == ThemeMode.dark;
        final title = _navItems.firstWhere((item) => item.$2 == loc, orElse: () => _navItems.first).$1;
        
        return Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.obsidian.withOpacity(0.95) : Colors.white.withOpacity(0.95),
            border: Border(
              bottom: BorderSide(color: isDark ? AppColors.gold : AppColors.gold.withOpacity(0.3), width: 1),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.gold.withOpacity(isDark ? 0.08 : 0.04),
                blurRadius: 24,
                spreadRadius: 0,
              ),
            ],
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildKubergLogo(context, isDark),
                      const Spacer(),
                      if (!isMobile) ...[
                        ..._navItems.map(
                          (item) => _NavLink(
                            label: item.$1,
                            route: item.$2,
                            active: loc == item.$2,
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                      _PlayStoreButton(),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () {
                          themeModeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
                        },
                        icon: Icon(
                          isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                          color: AppColors.gold,
                          size: 24,
                        ),
                        tooltip: 'Toggle Theme',
                      ),
                      if (isMobile) ...[
                        const SizedBox(width: 8),
                        IconButton(
                          icon: Icon(
                            _menuOpen ? Icons.close : Icons.menu,
                            color: AppColors.gold,
                            size: 28,
                          ),
                          onPressed: () => setState(() => _menuOpen = !_menuOpen),
                        ),
                      ],
                    ],
                  ),
                  if (!isMobile) ...[
                    const SizedBox(height: 10),
                    Text(
                      '{ $title }',
                      style: TextStyle(
                        fontFamily: 'Hero',
                        color: isDark ? AppColors.gold.withOpacity(0.9) : AppColors.gold,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildKubergLogo(BuildContext context, bool isDark) {
    return GestureDetector(
      onTap: () => context.go('/'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'kuber',
                style: TextStyle(
                  fontFamily: 'Hero',
                  color: isDark ? AppColors.ivory : Colors.black87,
                  fontSize: 22 * 0.9,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.5,
                ),
              ),
              const Text(
                'g',
                style: TextStyle(
                  fontFamily: 'Hero',
                  color: AppColors.gold,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Text(
            'FACTORY',
            style: TextStyle(
              fontFamily: 'Hero',
              color: AppColors.gold.withOpacity(0.9),
              fontSize: 8,
              fontWeight: FontWeight.w900,
              letterSpacing: 4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileMenu(BuildContext context, String loc) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: GestureDetector(
        onTap: () => setState(() => _menuOpen = false),
        child: Container(
          color: Colors.black.withOpacity(0.85),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 80),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.charcoal,
                border: Border.all(color: AppColors.gold.withOpacity(0.3)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _navItems.map((item) {
                  final active = loc == item.$2;
                  return InkWell(
                    onTap: () {
                      setState(() => _menuOpen = false);
                      context.go(item.$2);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: AppColors.divider),
                        ),
                        color: active ? AppColors.gold.withOpacity(0.08) : Colors.transparent,
                      ),
                      child: Text(
                        item.$1,
                        style: GoogleFonts.inter(
                          color: active ? AppColors.gold : AppColors.ivory,
                          fontSize: 16,
                          fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingWhatsApp(BuildContext context) {
    return Positioned(
      right: 24,
      bottom: 30,
      child: Tooltip(
        message: 'Chat with us on WhatsApp',
        child: GestureDetector(
          onTap: () => launchUrl(
            Uri.parse('https://wa.me/919922965494?text=Hello%20Kuber%20Gold%20Factory%2C%20I%20would%20like%20to%20inquire%20about%20your%20services.'),
            mode: LaunchMode.externalApplication,
          ),
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFF25D366),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF25D366).withOpacity(0.4),
                  blurRadius: 16,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const Icon(Icons.chat_bubble_rounded, color: Colors.white, size: 30),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final String route;
  final bool active;

  const _NavLink({required this.label, required this.route, required this.active});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => context.go(widget.route),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: widget.active ? AppColors.gold : (_hovered ? AppColors.gold.withOpacity(0.5) : Colors.transparent),
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.inter(
              color: widget.active ? AppColors.gold : (_hovered ? AppColors.ivory : AppColors.textMuted),
              fontSize: 13,
              fontWeight: widget.active ? FontWeight.w600 : FontWeight.w400,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayStoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const MiligramLaunchDialog(),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.gold.withOpacity(0.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 14),
            const SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'GET IT ON',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 6,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Google Play',
                  style: TextStyle(
                    fontFamily: 'Hero',
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MiligramLaunchDialog extends StatefulWidget {
  const MiligramLaunchDialog({super.key});

  @override
  State<MiligramLaunchDialog> createState() => _MiligramLaunchDialogState();
}

class _MiligramLaunchDialogState extends State<MiligramLaunchDialog> {
  late Timer _timer;
  late Duration _timeLeft;
  final DateTime _launchDate = DateTime(2026, 4, 2);

  @override
  void initState() {
    super.initState();
    _calculateTimeLeft();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _calculateTimeLeft();
        });
      }
    });
  }

  void _calculateTimeLeft() {
    final now = DateTime.now();
    _timeLeft = _launchDate.difference(now);
    if (_timeLeft.isNegative) {
      _timeLeft = Duration.zero;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
          color: isDark ? AppColors.obsidian : AppColors.ivory,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.gold.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Announcement Bar
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                  ),
                ),
                child: const Text(
                  'ANNOUNCEMENT: MILIGRAM APP IS ON TRIAL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Hero',
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    const Text(
                      'OFFICIAL LAUNCH',
                      style: TextStyle(
                        fontFamily: 'Hero',
                        color: AppColors.gold,
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'HANUMAN JAYANTI',
                      style: TextStyle(
                        fontFamily: 'Hero',
                        color: isDark ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        letterSpacing: -1,
                      ),
                    ),
                    Text(
                      'APRIL 2, 2026',
                      style: TextStyle(
                        fontFamily: 'Hero',
                        color: isDark ? Colors.white54 : Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _CountdownUnit(value: _timeLeft.inDays, label: 'DAYS'),
                        _CountdownUnit(value: _timeLeft.inHours % 24, label: 'HOURS'),
                        _CountdownUnit(value: _timeLeft.inMinutes % 60, label: 'MINS'),
                        _CountdownUnit(value: _timeLeft.inSeconds % 60, label: 'SECS'),
                      ],
                    ),
                    const SizedBox(height: 48),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.gold,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        'NOTIFY ME',
                        style: TextStyle(
                          fontFamily: 'Hero',
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CountdownUnit extends StatelessWidget {
  final int value;
  final String label;

  const _CountdownUnit({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Column(
      children: [
        Text(
          value.toString().padLeft(2, '0'),
          style: TextStyle(
            fontFamily: 'Hero',
            color: AppColors.gold,
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Hero',
            color: isDark ? Colors.white38 : Colors.black38,
            fontSize: 10,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
