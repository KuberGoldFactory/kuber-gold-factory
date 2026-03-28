import 'package:flutter/material.dart';
import '../main.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHero(context),
          _buildVision(context),
          _buildSynergy(context),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      height: 400,
      width: double.infinity,
      color: isDark ? AppColors.obsidian : AppColors.ivory,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'OUR VISION',
              style: TextStyle(
                fontFamily: 'Hero',
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
              style: TextStyle(
                fontFamily: 'Hero',
                color: isDark ? AppColors.ivory : Colors.black,
                fontSize: MediaQuery.of(context).size.width < 600 ? 32 : 48,
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: isDark ? AppColors.charcoal : Colors.black.withOpacity(0.02),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              Text(
                'Kuber Gold Factory is the face of industrial excellence and product quality. Our motive is to refine the bridge between traditional manufacturing and futuristic technology. By integrating Kuber\'s production power with Miligram\'s digital intelligence, we are creating a seamless supply chain from factory to doorstep.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Hero',
                  color: isDark ? AppColors.textMain : Colors.black.withOpacity(0.8),
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      color: isDark ? AppColors.obsidian : AppColors.ivory,
      child: Column(
        children: [
          const Text(
            'THE SYNERGY',
            style: TextStyle(
              fontFamily: 'Hero',
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
                isDark: isDark,
                title: 'Kuber Gold Factory',
                subtitle: 'Manufacturing Excellence',
                desc: 'Managing product quality checks, high-precision manufacturing, and complete industrial setups.',
              ),
              _SynergyCard(
                isDark: isDark,
                title: 'Miligram Arm',
                subtitle: 'Digital Supply Chain',
                desc: 'Specialized digital tools for B2B accounting, secure logistics, and highly efficient doorstep delivery services.',
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
  final bool isDark;

  const _SynergyCard({
    required this.title, 
    required this.subtitle, 
    required this.desc,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: AppColors.gold.withOpacity(isDark ? 0.04 : 0.08),
        border: Border.all(color: AppColors.gold.withOpacity(isDark ? 0.15 : 0.2)),
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
              style: const TextStyle(
                fontFamily: 'Hero',
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
            style: TextStyle(
              fontFamily: 'Hero',
              color: isDark ? AppColors.ivory : Colors.black87,
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            desc,
            style: TextStyle(
              fontFamily: 'Hero',
              color: isDark ? AppColors.textMain : Colors.black.withOpacity(0.7),
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



