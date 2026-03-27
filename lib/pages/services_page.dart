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
            'CORE BUSINESS',
            'Primary jewelry and testing services.',
            true,
            [
              const _ServiceItem(
                title: '1. Jewelry Deals',
                desc: 'Exclusive wholesale and retail deals on high-precision jewelry products.',
              ),
              const _ServiceItem(
                title: '6. Jewelry Testing',
                desc: 'Professional quality testing. Requests are settled within 24 hours.',
              ),
            ],
          ),
          _buildCategory(
            context,
            'MILIGRAM DIGITAL & B2B',
            'Digital tools and business management.',
            false,
            [
              const _ServiceItem(
                title: '7. Inventory Management',
                desc: 'Specialized digital ledger and inventory tracking systems for jewelry businesses.',
              ),
              const _ServiceItem(
                title: '4. Mortgage (Upcoming)',
                desc: 'Upcoming secure processing for gold-backed financial operations.',
              ),
              const _ServiceItem(
                title: '2. SIP (Upcoming)',
                desc: 'Strategic Investment Plans backed by physical gold assets (Coming Soon).',
              ),
            ],
          ),
          _buildCategory(
            context,
            'INDUSTRIAL HORIZONS',
            'Scaling the future of gold production.',
            true,
            [
              const _ServiceItem(
                title: '5. Refinery (Upcoming)',
                desc: 'Industrial-grade metal purification and high-purity refinery services.',
              ),
              const _ServiceItem(
                title: '3. Bullion (Upcoming)',
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
      bgColor = altBackground ? AppColors.ivory.withOpacity(0.5) : AppColors.ivory;
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
                  color: isDark ? AppColors.textMuted : Colors.black.withOpacity(0.6),
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
              color: isDark ? AppColors.textMain : Colors.black.withOpacity(0.7),
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



