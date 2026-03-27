import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                  fontSize: 26 * 0.9,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.5,
                ),
              ),
              const Text(
                'g',
                style: TextStyle(
                  fontFamily: 'Hero',
                  color: AppColors.gold,
                  fontSize: 26,
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
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 4.5,
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
                        style: TextStyle(
                          fontFamily: 'Hero',
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
}

