import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';

class VisionPage extends StatelessWidget {
  const VisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHero(context, isDark),
          _buildCoreVision(context, isDark),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.obsidian : AppColors.ivory,
        border: Border(
          bottom: BorderSide(color: AppColors.gold.withOpacity(0.2)),
        ),
      ),
      child: Column(
        children: [
          Text(
            'OUR VISION',
            style: TextStyle(
              fontFamily: 'Hero',
              color: AppColors.gold,
              fontSize: 14,
              fontWeight: FontWeight.w900,
              letterSpacing: 8,
            ),
          ),
          const SizedBox(height: 48),
          Text(
            '{ कुबेर गोल्ड फॅक्टरी }',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: isDark ? Colors.white : Colors.black,
              fontSize: 56,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'KUBER GOLD FACTORY',
            style: TextStyle(
              fontFamily: 'Hero',
              color: AppColors.gold.withOpacity(0.7),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              letterSpacing: 4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoreVision(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 900),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _VisionSection(
            isDark: isDark,
            title: 'MANUFACTURING FIRST',
            content: 'At Kuber Gold Factory, our vision is rooted in the precision of the physical world. We believe that true financial security starts with the purity of the metal and the excellence of the craftsmanship. Our facilities are designed to set the benchmark for gold refining and jewelry manufacturing in the modern era.',
          ),
          const SizedBox(height: 60),
          _VisionSection(
            isDark: isDark,
            title: 'INDUSTRIAL STRENGTH',
            content: 'We provide the industrial backbone for the Miligram ecosystem. While Miligram handles the digital intelligence and supply chain, Kuber Gold Factory remains the physical heart—managing high-precision setups, rigorous quality checks, and large-scale manufacturing for B2B partners worldwide.',
          ),
          const SizedBox(height: 60),
          _VisionSection(
            isDark: isDark,
            title: 'THE KUBER STANDARD',
            content: 'Every gram of gold that passes through our factory carries the "Kuber Standard"—a guarantee of 24K excellence, ethical sourcing, and industrial-grade transparency. Our mission is to transform the traditional jewelry workshop into a state-of-the-art manufacturing powerhouse.',
          ),
        ],
      ),
    );
  }
}

class _VisionSection extends StatelessWidget {
  final String title;
  final String content;
  final bool isDark;

  const _VisionSection({
    required this.title, 
    required this.content, 
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 2,
              color: AppColors.gold,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Hero',
                color: AppColors.gold,
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          content,
          style: TextStyle(
            fontFamily: 'Hero',
            color: isDark ? AppColors.textMain : Colors.black87,
            fontSize: 18,
            height: 1.8,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
