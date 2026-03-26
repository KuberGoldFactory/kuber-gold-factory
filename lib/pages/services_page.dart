import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
        child: Column(
          children: [
            Text(
              'OUR SERVICES',
              style: GoogleFonts.playfairDisplay(
                color: AppColors.gold,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            Wrap(
              spacing: 30,
              runSpacing: 30,
              alignment: WrapAlignment.center,
              children: [
                _ServiceCard(
                  title: 'Bullion Trading',
                  icon: Icons.currency_bitcoin_rounded,
                  description: 'Wholesale trading of high-purity gold and silver bars.',
                ),
                _ServiceCard(
                  title: 'Custom Casting',
                  icon: Icons.architecture_rounded,
                  description: 'Precision casting services for jewelry manufacturers.',
                ),
                _ServiceCard(
                  title: 'Assaying Services',
                  icon: Icons.science_rounded,
                  description: 'Advanced fire assaying and non-destructive testing.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;

  const _ServiceCard({required this.title, required this.icon, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        border: Border.all(color: AppColors.gold.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.gold, size: 40),
          const SizedBox(height: 24),
          Text(
            title,
            style: GoogleFonts.playfairDisplay(
              color: AppColors.ivory,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.inter(
              color: AppColors.textMuted,
              fontSize: 16,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
