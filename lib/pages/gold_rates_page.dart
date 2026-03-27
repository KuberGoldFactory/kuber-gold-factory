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
              constraints: const BoxConstraints(maxWidth: 600),
              padding: const EdgeInsets.all(48),
              decoration: BoxDecoration(
                color: AppColors.gold.withOpacity(0.05),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.gold.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                   Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.gold.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.access_time_filled_rounded,
                      color: AppColors.gold,
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'REAL-TIME BOOKING',
                    style: TextStyle(
                      fontFamily: 'Hero',
                      color: AppColors.gold,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Feature is coming soon.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Hero',
                      color: isDark ? AppColors.ivory : Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 24),
                   Text(
                    'We are integrating professional bullion exchanges to provide you with spot-on market rates and instant booking capabilities.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Hero',
                      color: isDark ? AppColors.textMuted : Colors.black54,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
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



