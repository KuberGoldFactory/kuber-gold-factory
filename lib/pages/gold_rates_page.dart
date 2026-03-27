import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';

class GoldRatesPage extends StatelessWidget {
  const GoldRatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
        child: Column(
          children: [
            Text(
              'BULLION STANDARDS',
              style: GoogleFonts.playfairDisplay(
                color: AppColors.gold,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'KUBER MARKET RATES',
              style: GoogleFonts.playfairDisplay(
                color: AppColors.ivory,
                fontSize: 48,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Last Updated: March 27, 2026',
              style: GoogleFonts.inter(
                color: AppColors.textMuted,
                fontSize: 14,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 60),
            Container(
              constraints: const BoxConstraints(maxWidth: 800),
              decoration: BoxDecoration(
                color: AppColors.charcoal,
                border: Border.all(color: AppColors.gold.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  _buildHeaderRow(),
                  _buildRateRow('24K Fine Gold (99.9%)', '₹ 6,540 / gm'),
                  _buildRateRow('22K Standard Gold (91.6%)', '₹ 6,120 / gm'),
                  _buildRateRow('18K Gold (75.0%)', '₹ 5,010 / gm'),
                  _buildRateRow('Pure Silver (99.9%)', '₹ 78.50 / gm'),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Text(
              '* All rates are indicative of Kuber Gold Factory and Kuber Gold Bullion standards.',
              style: GoogleFonts.inter(
                color: AppColors.textMuted,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      decoration: BoxDecoration(
        color: AppColors.gold.withOpacity(0.1),
        border: const Border(bottom: BorderSide(color: AppColors.gold, width: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'METAL TYPE',
            style: GoogleFonts.inter(
              color: AppColors.gold,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          Text(
            'RATE (INR)',
            style: GoogleFonts.inter(
              color: AppColors.gold,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRateRow(String type, String rate) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gold.withOpacity(0.1))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            type,
            style: GoogleFonts.inter(
              color: AppColors.ivory,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            rate,
            style: GoogleFonts.inter(
              color: AppColors.goldLight,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

