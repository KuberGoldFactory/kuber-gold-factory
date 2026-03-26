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
              'GLOBAL NETWORK',
              style: GoogleFonts.playfairDisplay(
                color: AppColors.gold,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            Wrap(
              spacing: 40,
              runSpacing: 40,
              alignment: WrapAlignment.center,
              children: [
                _LocationCard(city: 'Mumbai', address: 'Zaveri Bazaar, Marine Lines'),
                _LocationCard(city: 'Delhi', address: 'Karol Bagh, New Delhi'),
                _LocationCard(city: 'Dubai', address: 'Gold Souk, Deira'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  final String city;
  final String address;

  const _LocationCard({required this.city, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        border: Border.all(color: AppColors.gold.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        children: [
          Icon(Icons.location_on_rounded, color: AppColors.gold, size: 32),
          const SizedBox(height: 20),
          Text(
            city,
            style: GoogleFonts.playfairDisplay(
              color: AppColors.ivory,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            address,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: AppColors.textMuted,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
