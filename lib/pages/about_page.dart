import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OUR LEGACY',
                  style: GoogleFonts.playfairDisplay(
                    color: AppColors.gold,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'Kuber Gold Factory represents the pinnacle of craftsmanship and integrity in the jewelry industry. With decades of experience, we have established ourselves as a premier destination for high-quality gold and bullion.',
                  style: GoogleFonts.inter(
                    color: AppColors.ivory,
                    fontSize: 18,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Our commitment to transparency and purity is unwavering. Every piece that leaves our facility is rigorously tested and verified to meet international standards of excellence.',
                  style: GoogleFonts.inter(
                    color: AppColors.textMuted,
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
