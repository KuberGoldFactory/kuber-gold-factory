import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHero(context),
          _buildFeatures(context),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.obsidian,
            AppColors.charcoal.withOpacity(0.8),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'THE ART OF PURE GOLD',
                style: GoogleFonts.playfairDisplay(
                  color: AppColors.gold,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 8,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'KUBER GOLD FACTORY',
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  color: AppColors.ivory,
                  fontSize: 64,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 32),
              Container(
                width: 80,
                height: 2,
                color: AppColors.gold,
              ),
              const SizedBox(height: 32),
              Text(
                'EXCELLENCE • PURITY • TRUST',
                style: GoogleFonts.inter(
                  color: AppColors.textMuted,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatures(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: AppColors.charcoal,
      child: Wrap(
        spacing: 40,
        runSpacing: 40,
        alignment: WrapAlignment.center,
        children: [
          _FeatureCard(
            icon: Icons.high_quality_rounded,
            title: '99.9% Purity',
            desc: 'Certified and hallmarked gold ensuring the highest standards of quality.',
          ),
          _FeatureCard(
            icon: Icons.factory_rounded,
            title: 'Direct Supply',
            desc: 'Direct from the factory pricing, eliminating middlemen for best value.',
          ),
          _FeatureCard(
            icon: Icons.verified_user_rounded,
            title: 'Legacy of Trust',
            desc: 'Serving the industry with transparency and reliability for generations.',
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _FeatureCard({required this.icon, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        border: Border.all(color: AppColors.gold.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.gold, size: 48),
          const SizedBox(height: 24),
          Text(
            title,
            style: GoogleFonts.playfairDisplay(
              color: AppColors.ivory,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: AppColors.textMuted,
              fontSize: 15,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
