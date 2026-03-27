import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';

class DealerNetworkPage extends StatelessWidget {
  const DealerNetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
        child: Column(
          children: [
            Text(
              'SUPPLY CHAIN NETWORK',
              style: GoogleFonts.playfairDisplay(
                color: AppColors.gold,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'POWERED BY MILIGRAM',
              style: GoogleFonts.playfairDisplay(
                color: AppColors.ivory,
                fontSize: 48,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Text(
                'Our B2B dealer network operates on the Miligram digital supply chain, ensuring real-time inventory tracking, secure accounting, and upcoming drone-assisted local logistics.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: AppColors.textMuted,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 80),
            Wrap(
              spacing: 40,
              runSpacing: 40,
              alignment: WrapAlignment.center,
              children: [
                _NetworkHub(city: 'Manufacturing Hub', address: 'Akot Factory Setup'),
                _NetworkHub(city: 'Distribution node', address: 'Regional Supply Points'),
                _NetworkHub(city: 'Partner Outlets', address: 'Verified Dealer Network'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NetworkHub extends StatelessWidget {
  final String city;
  final String address;

  const _NetworkHub({required this.city, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        border: Border.all(color: AppColors.gold.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Icon(Icons.hub_outlined, color: AppColors.gold, size: 32),
          const SizedBox(height: 20),
          Text(
            city,
            style: GoogleFonts.playfairDisplay(
              color: AppColors.ivory,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            address,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: AppColors.textMain,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

