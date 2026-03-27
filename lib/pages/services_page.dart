import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHero(),
          _buildCategory(
            context,
            'MILIGRAM DIGITAL SUITE',
            'Digital tools for business transparency.',
            [
              _ServiceItem(
                title: 'B2B Accounting',
                desc: 'Specialized digital ledger systems designed for jewelry business transparency and financial precision.',
              ),
              _ServiceItem(
                title: 'Buying & Selling',
                desc: 'Streamlined digital platforms for wholesale transactions with real-time tracking.',
              ),
              _ServiceItem(
                title: 'Mortgage Solutions',
                desc: 'Secure digital processing for gold-backed financial operations and secure SIP / FD tracking.',
              ),
            ],
          ),
          _buildCategory(
            context,
            'PHYSICAL SERVICES',
            'Expert manufacturing and logistical solutions.',
            [
              _ServiceItem(
                title: 'Quality Manufacturing',
                desc: 'Full-scale manufacturing setup and quality control for premium jewelry products.',
              ),
              _ServiceItem(
                title: 'Gold Repairing',
                desc: 'Precision metal restoration and expert jewelry repairing services.',
              ),
              _ServiceItem(
                title: 'Drone Delivery',
                desc: 'Upcoming 1km range secure drone service for instantaneous door-to-door jewelry delivery.',
              ),
            ],
          ),
          _buildCategory(
            context,
            'FUTURE HORIZONS',
            'Expanding the standards of excellence.',
            [
              _ServiceItem(
                title: 'Gold Refinery',
                desc: 'Setting new benchmarks in metal purification and high-purity refinery services.',
              ),
              _ServiceItem(
                title: 'Bullion Services',
                desc: 'Standardized bullion trading and secure investment-grade metal supply.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      height: 300,
      width: double.infinity,
      color: AppColors.obsidian,
      child: Center(
        child: Text(
          'OUR SERVICES',
          style: GoogleFonts.playfairDisplay(
            color: AppColors.ivory,
            fontSize: 48,
            fontWeight: FontWeight.w900,
            letterSpacing: 4,
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(BuildContext context, String title, String subtitle, List<_ServiceItem> items) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: items.length % 2 == 0 ? AppColors.charcoal : AppColors.obsidian,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                title,
                style: GoogleFonts.playfairDisplay(
                  color: AppColors.gold,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                subtitle,
                style: GoogleFonts.inter(
                  color: AppColors.textMuted,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 60),
              Wrap(
                spacing: 40,
                runSpacing: 40,
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
    return Container(
      width: 350,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.gold.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 2,
            color: AppColors.gold,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: GoogleFonts.playfairDisplay(
              color: AppColors.ivory,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            desc,
            style: GoogleFonts.inter(
              color: AppColors.textMain,
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

