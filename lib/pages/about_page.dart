import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHero(),
          _buildVision(context),
          _buildSynergy(context),
        ],
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      height: 400,
      width: double.infinity,
      color: AppColors.obsidian,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'OUR VISION',
              style: GoogleFonts.heebo(
                color: AppColors.gold,
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'A UNIFIED ECOSYSTEM\nFOR THE MODERN AGE',
              textAlign: TextAlign.center,
              style: GoogleFonts.heebo(
                color: AppColors.ivory,
                fontSize: 48,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVision(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: AppColors.charcoal,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              Text(
                'Kuber Gold Factory is the face of industrial excellence and product quality. Our motive is to refine the bridge between traditional manufacturing and futuristic technology. By integrating Kuber\'s production power with Miligram\'s digital intelligence, we are creating a seamless supply chain from factory to doorstep.',
                textAlign: TextAlign.center,
                style: GoogleFonts.heebo(
                  color: AppColors.textMain,
                  fontSize: 18,
                  height: 1.8,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSynergy(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      color: AppColors.obsidian,
      child: Column(
        children: [
          Text(
            'THE SYNERGY',
            style: GoogleFonts.heebo(
              color: AppColors.gold,
              fontSize: 12,
              fontWeight: FontWeight.w900,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              _SynergyCard(
                title: 'Kuber Gold Factory',
                subtitle: 'Manufacturing Excellence',
                desc: 'Managing product quality checks, high-precision manufacturing, and complete industrial setups.',
              ),
              _SynergyCard(
                title: 'Miligram Arm',
                subtitle: 'Digital Supply Chain',
                desc: 'Specialized digital tools for B2B accounting, secure logistics, and future drone-based delivery services.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SynergyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String desc;

  const _SynergyCard({required this.title, required this.subtitle, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: AppColors.gold.withOpacity(0.04),
        border: Border.all(color: AppColors.gold.withOpacity(0.15)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.gold.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              subtitle.toUpperCase(),
              style: GoogleFonts.heebo(
                color: AppColors.gold,
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.heebo(
              color: AppColors.ivory,
              fontSize: 28,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            desc,
            style: GoogleFonts.heebo(
              color: AppColors.textMain,
              fontSize: 16,
              height: 1.7,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}


