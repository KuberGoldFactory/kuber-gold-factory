import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHero(context),
          _buildEcosystem(context),
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
                'THE KUBER ECOSYSTEM',
                style: GoogleFonts.playfairDisplay(
                  color: AppColors.gold,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 8,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'MANUFACTURING EXCELLENCE\nMEETS DIGITAL INNOVATION',
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  color: AppColors.ivory,
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                  height: 1.2,
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
                'FROM FACTORY PRECISION TO DRONE DELIVERY',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: AppColors.textMuted,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 6,
                ),
              ),
              const SizedBox(height: 48),
              OutlinedButton(
                onPressed: () => context.go('/about'),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.gold),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                ),
                child: Text(
                  'DISCOVER THE VISION',
                  style: GoogleFonts.inter(
                    color: AppColors.gold,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEcosystem(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      color: AppColors.charcoal,
      child: Column(
        children: [
          Text(
            'CORE PILLARS',
            style: GoogleFonts.playfairDisplay(
              color: AppColors.gold,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _EcosystemCard(
                icon: Icons.factory_outlined,
                title: 'Kuber Factory',
                desc: 'Managing high-precision manufacturing, quality checks, and industrial setups for the gold industry.',
              ),
              _EcosystemCard(
                icon: Icons.app_registration_outlined,
                title: 'Miligram App',
                desc: 'Digital tools for B2B accounting, secure supply chain management, and wealth services.',
              ),
              _EcosystemCard(
                icon: Icons.airplanemode_active_outlined,
                title: 'Drone Delivery',
                desc: 'Future-forward 1km range drone service for seamless, secure door-to-door jewelry logistics.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EcosystemCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _EcosystemCard({required this.icon, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        border: Border.all(color: AppColors.gold.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.gold, size: 48),
          const SizedBox(height: 32),
          Text(
            title,
            style: GoogleFonts.playfairDisplay(
              color: AppColors.ivory,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
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

