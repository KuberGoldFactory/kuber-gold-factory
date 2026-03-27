import 'package:flutter/material.dart';
import '../main.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHero(context),
          _buildCategory(
            context,
            'MILIGRAM DIGITAL SUITE',
            'Digital tools for business transparency.',
            true,
            [
              const _ServiceItem(
                title: 'B2B Accounting',
                desc: 'Specialized digital ledger systems designed for jewelry business transparency and financial precision.',
              ),
              const _ServiceItem(
                title: 'Buying & Selling',
                desc: 'Streamlined digital platforms for wholesale transactions with real-time tracking.',
              ),
              const _ServiceItem(
                title: 'Mortgage Solutions',
                desc: 'Secure digital processing for gold-backed financial operations and secure SIP / FD tracking.',
              ),
            ],
          ),
          _buildCategory(
            context,
            'PHYSICAL SERVICES',
            'Expert manufacturing and logistical solutions.',
            false,
            [
              const _ServiceItem(
                title: 'Quality Manufacturing',
                desc: 'Full-scale manufacturing setup and quality control for premium jewelry products.',
              ),
              const _ServiceItem(
                title: 'Gold Repairing',
                desc: 'Precision metal restoration and expert jewelry repairing services.',
              ),
              const _ServiceItem(
                title: 'Drone Delivery',
                desc: 'Upcoming 1km range secure drone service for instantaneous door-to-door jewelry delivery.',
              ),
            ],
          ),
          _buildCategory(
            context,
            'FUTURE HORIZONS',
            'Expanding the standards of excellence.',
            true,
            [
              const _ServiceItem(
                title: 'Gold Refinery',
                desc: 'Setting new benchmarks in metal purification and high-purity refinery services.',
              ),
              const _ServiceItem(
                title: 'Bullion Services',
                desc: 'Standardized bullion trading and secure investment-grade metal supply.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      height: 300,
      width: double.infinity,
      color: isDark ? AppColors.obsidian : AppColors.ivory,
      child: Center(
        child: Text(
          'OUR SERVICES',
          style: TextStyle(
            fontFamily: 'Hero',
            color: isDark ? AppColors.ivory : Colors.black87,
            fontSize: 48,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(BuildContext context, String title, String subtitle, bool altBackground, List<_ServiceItem> items) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Color bgColor;
    if (isDark) {
      bgColor = altBackground ? AppColors.charcoal : AppColors.obsidian;
    } else {
      bgColor = altBackground ? Colors.black.withOpacity(0.02) : Colors.white;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: bgColor,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Hero',
                  color: AppColors.gold,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: 'Hero',
                  color: isDark ? AppColors.textMuted : Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 60),
              Wrap(
                spacing: 32,
                runSpacing: 32,
                alignment: WrapAlignment.center,
                children: items,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceItem extends StatelessWidget {
  final String title;
  final String desc;

  const _ServiceItem({required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      width: 350,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.gold.withOpacity(isDark ? 0.04 : 0.08),
        border: Border.all(color: AppColors.gold.withOpacity(isDark ? 0.12 : 0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.gold,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Hero',
              color: isDark ? AppColors.ivory : Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            desc,
            style: TextStyle(
              fontFamily: 'Hero',
              color: isDark ? AppColors.textMain : Colors.black54,
              fontSize: 15,
              height: 1.6,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}



