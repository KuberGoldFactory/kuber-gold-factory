import 'dart:async';
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
    ('Gold Rates', '/gold-rates'),
    ('Dealer Network', '/dealer-network'),
    ('Contact', '/contact'),
  ];

  @override
  Widget build(BuildContext context) {
    final loc = GoRouterState.of(context).uri.toString();
    final isMobile = MediaQuery.of(context).size.width < 1100; // Increased threshold for sidebar comfort
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.obsidian : AppColors.ivory,
      drawer: isMobile ? _buildMobileDrawer(context, loc) : null,
      body: Row(
        children: [
          if (!isMobile) _buildSidebar(context, loc, isDark),
          Expanded(
            child: Stack(
              children: [
                Column(
                  children: [
                    if (isMobile) _buildMobileHeader(context, loc, isDark) else _buildDesktopHeader(context, loc, isDark),
                    Expanded(
                      child: ClipRRect(
                        // Give content a slight rounded feel like the reference
                        borderRadius: isMobile ? BorderRadius.zero : const BorderRadius.only(topLeft: Radius.circular(24)),
                        child: Container(
                          color: isDark ? AppColors.charcoal : Colors.white,
                          child: widget.child,
                        ),
                      ),
                    ),
                  ],
                ),
                _buildFloatingWhatsApp(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context, String loc, bool isDark) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: isDark ? AppColors.obsidian : AppColors.ivory,
        border: Border(
          right: BorderSide(color: AppColors.gold.withOpacity(0.15)),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _buildKubergLogo(context, isDark),
          ),
          const SizedBox(height: 40),
          // Mock Search Bar from reference
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.search_rounded, color: AppColors.gold.withOpacity(0.5), size: 20),
                  const SizedBox(width: 12),
                  Text(
                    'Search Ecosystem...',
                    style: TextStyle(
                      fontFamily: 'Hero',
                      color: AppColors.textMuted,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _SidebarItem(
                  icon: Icons.dashboard_rounded,
                  label: 'Dashboard',
                  route: '/',
                  active: loc == '/',
                ),
                _SidebarServicesItem(active: loc.startsWith('/services')),
                _SidebarItem(
                  icon: Icons.info_rounded,
                  label: 'About Vision',
                  route: '/about',
                  active: loc == '/about',
                ),
                _SidebarItem(
                  icon: Icons.trending_up_rounded,
                  label: 'Gold Rates',
                  route: '/gold-rates',
                  active: loc == '/gold-rates',
                ),
                _SidebarItem(
                  icon: Icons.hub_rounded,
                  label: 'Dealer Network',
                  route: '/dealer-network',
                  active: loc == '/dealer-network',
                ),
                _SidebarItem(
                  icon: Icons.contact_support_rounded,
                  label: 'Contact Support',
                  route: '/contact',
                  active: loc == '/contact',
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _PlayStoreButton(),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    themeModeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
                  },
                  icon: Icon(
                    isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                    color: AppColors.gold,
                  ),
                  tooltip: 'Toggle Theme',
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildMobileHeader(BuildContext context, String loc, bool isDark) {
    final isHome = loc == '/';
    final title = _navItems.firstWhere((item) => item.$2 == loc, orElse: () => _navItems.first).$1;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.obsidian : Colors.white,
        border: Border(bottom: BorderSide(color: AppColors.gold.withOpacity(0.2))),
      ),
      child: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Centered title
            Text(
              isHome ? 'कुबेर गोल्ड फॅक्टरी' : '{ $title }',
              style: TextStyle(
                fontFamily: isHome ? 'Mahamaya' : 'Hero',
                color: AppColors.gold,
                fontSize: isHome ? 18 : 13,
                fontWeight: isHome ? FontWeight.normal : FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            // Logo on left
            Align(
              alignment: Alignment.centerLeft,
              child: _buildKubergLogo(context, isDark, scale: 0.8),
            ),
            // Hamburger on right
            Align(
              alignment: Alignment.centerRight,
              child: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu_rounded, color: AppColors.gold),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopHeader(BuildContext context, String loc, bool isDark) {
    final isHome = loc == '/';
    final title = _navItems.firstWhere((item) => item.$2 == loc, orElse: () => _navItems.first).$1;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      color: isDark ? AppColors.obsidian : AppColors.ivory,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            isHome ? 'कुबेर गोल्ड फॅक्टरी' : '{ $title }',
            style: TextStyle(
              fontFamily: isHome ? 'Mahamaya' : 'Hero',
              color: AppColors.gold,
              fontSize: isHome ? 36 : 18,
              fontWeight: isHome ? FontWeight.normal : FontWeight.w700,
              letterSpacing: isHome ? 1 : 2,
            ),
          ),
          // Possibly add some top bar actions here later if needed
        ],
      ),
    );
  }

  Widget _buildMobileDrawer(BuildContext context, String loc) {
    return Drawer(
      backgroundColor: AppColors.obsidian,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.gold.withOpacity(0.2))),
            ),
            child: Center(child: _buildKubergLogo(context, true)),
          ),
          Expanded(
            child: ListView(
              children: [
                ..._navItems.map((item) => ListTile(
                  title: Text(item.$1, style: const TextStyle(color: AppColors.ivory, fontFamily: 'Hero')),
                  selected: loc == item.$2,
                  selectedTileColor: AppColors.gold.withOpacity(0.1),
                  onTap: () {
                    Navigator.pop(context);
                    context.go(item.$2);
                  },
                )),
                ListTile(
                  title: const Text('SERVICES', style: TextStyle(color: AppColors.ivory, fontFamily: 'Hero')),
                  onTap: () {
                    Navigator.pop(context);
                    context.go('/services');
                  },
                ),
              ],
            ),
          ),
          const _PlayStoreButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildKubergLogo(BuildContext context, bool isDark, {double scale = 1.0}) {
    final baseFontSize = 28.0 * scale; // Increased base size from 22
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
                  fontSize: baseFontSize * 0.9,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.5,
                ),
              ),
              Text(
                'g',
                style: TextStyle(
                  fontFamily: 'Hero',
                  color: AppColors.gold,
                  fontSize: baseFontSize,
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
              fontSize: baseFontSize * 0.36, // Scaled with base size
              fontWeight: FontWeight.w900,
              letterSpacing: 4 * scale,
            ),
          ),
        ],
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


class _PlayStoreButton extends StatelessWidget {
  const _PlayStoreButton();
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

class _SidebarItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final String route;
  final bool active;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.active,
  });

  @override
  State<_SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<_SidebarItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => context.go(widget.route),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: widget.active 
                ? AppColors.gold.withOpacity(0.12) 
                : (_hovered ? (isDark ? Colors.white10 : Colors.black.withOpacity(0.04)) : Colors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: widget.active ? AppColors.gold : (isDark ? AppColors.textMain : Colors.black87),
                size: 20,
              ),
              const SizedBox(width: 16),
              Text(
                widget.label,
                style: TextStyle(
                  fontFamily: 'Hero',
                  color: widget.active ? AppColors.gold : (isDark ? AppColors.textMain : Colors.black87),
                  fontSize: 14,
                  fontWeight: widget.active ? FontWeight.w900 : FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SidebarServicesItem extends StatelessWidget {
  final bool active;
  const _SidebarServicesItem({required this.active});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) => context.go('/services'),
      tooltip: 'View Services',
      offset: const Offset(260, 0),
      color: AppColors.charcoal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.gold.withOpacity(0.2)),
      ),
      itemBuilder: (context) => [
        _buildPopupItem('1. Jewelry Deals'),
        _buildPopupItem('2. SIP (Upcoming)'),
        _buildPopupItem('3. Bullion (Upcoming)'),
        _buildPopupItem('4. Mortgage (Upcoming)'),
        _buildPopupItem('5. Refinery (Upcoming)'),
        _buildPopupItem('6. Jewelry Testing'),
        _buildPopupItem('7. Inventory Management'),
      ],
      child: _SidebarItem(
        icon: Icons.category_rounded,
        label: 'Business Pillars',
        route: '/services', // Still navigates on direct click if parent allowed, but we use popup
        active: active,
      ),
    );
  }

  PopupMenuItem<String> _buildPopupItem(String label) {
    return PopupMenuItem<String>(
      value: label,
      child: Text(
        label,
        style: const TextStyle(fontFamily: 'Hero', fontSize: 13, color: AppColors.ivory),
      ),
    );
  }
}
