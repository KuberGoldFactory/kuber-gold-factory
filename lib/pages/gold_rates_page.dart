import 'package:flutter/material.dart';
import '../main.dart';

class GoldRatesPage extends StatelessWidget {
  const GoldRatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
        child: Column(
          children: [
            const Text(
              'BULLION STANDARDS',
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
              'KUBER MARKET RATES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Hero',
                color: isDark ? AppColors.ivory : Colors.black87,
                fontSize: 48,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Last Updated: March 27, 2026',
              style: TextStyle(
                fontFamily: 'Hero',
                color: isDark ? AppColors.textMuted : Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 60),
            Container(
              constraints: const BoxConstraints(maxWidth: 800),
              decoration: BoxDecoration(
                color: AppColors.gold.withOpacity(isDark ? 0.04 : 0.08),
                border: Border.all(color: AppColors.gold.withOpacity(isDark ? 0.15 : 0.2)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  children: [
                    _buildHeaderRow(isDark),
                    _buildRateRow('24K Fine Gold (99.9%)', '₹ 6,540 / gm', isDark),
                    _buildRateRow('22K Standard Gold (91.6%)', '₹ 6,120 / gm', isDark),
                    _buildRateRow('18K Gold (75.0%)', '₹ 5,010 / gm', isDark),
                    _buildRateRow('Pure Silver (99.9%)', '₹ 78.50 / gm', isDark),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              '* All rates are indicative of Kuber Gold Factory and Kuber Gold Bullion standards.',
              style: TextStyle(
                fontFamily: 'Hero',
                color: isDark ? AppColors.textMuted : Colors.black54,
                fontSize: 12,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow(bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      decoration: BoxDecoration(
        color: AppColors.gold.withOpacity(0.08),
        border: Border(bottom: BorderSide(color: AppColors.gold.withOpacity(0.2), width: 1)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'METAL TYPE',
            style: TextStyle(
              fontFamily: 'Hero',
              color: AppColors.gold,
              fontWeight: FontWeight.w900,
              fontSize: 12,
              letterSpacing: 2,
            ),
          ),
          Text(
            'RATE (INR)',
            style: TextStyle(
              fontFamily: 'Hero',
              color: AppColors.gold,
              fontWeight: FontWeight.w900,
              fontSize: 12,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRateRow(String type, String rate, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gold.withOpacity(0.05))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            type,
            style: TextStyle(
              fontFamily: 'Hero',
              color: isDark ? AppColors.ivory : Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            rate,
            style: const TextStyle(
              fontFamily: 'Hero',
              color: AppColors.gold,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}



