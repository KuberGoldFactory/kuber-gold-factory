import 'package:flutter/material.dart';
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            isDark ? AppColors.obsidian : AppColors.ivory,
            isDark ? AppColors.charcoal.withOpacity(0.8) : Colors.white.withOpacity(0.9),
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
                style: TextStyle(
                  fontFamily: 'Hero',
                  color: AppColors.gold.withOpacity(0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 8,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'MANUFACTURING EXCELLENCE\nMEETS DIGITAL INNOVATION',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Hero',
                  color: isDark ? AppColors.ivory : Colors.black87,
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 32),
              Container(
                width: 60,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'FROM FACTORY PRECISION TO DOORSTEP SERVICES',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Hero',
                  color: isDark ? AppColors.textMuted : Colors.black.withOpacity(0.6),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(height: 48),
              OutlinedButton(
                onPressed: () => context.go('/about'),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.gold),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                child: const Text(
                  'DISCOVER THE VISION',
                  style: TextStyle(
                    fontFamily: 'Hero',
                    color: AppColors.gold,
                    fontWeight: FontWeight.w700,
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      color: isDark ? AppColors.charcoal : AppColors.ivory,
      child: Column(
        children: [
          const Text(
            'CORE PILLARS',
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
              InkWell(
                onTap: () => context.go('/vision'),
                borderRadius: BorderRadius.circular(12),
                child: _EcosystemCard(
                  icon: Icons.factory_rounded,
                  isDark: isDark,
                  title: 'Kuber Factory',
                  desc: 'Managing high-precision manufacturing, quality checks, and industrial setups for the gold industry.',
                ),
              ),
              _EcosystemCard(
                icon: Icons.layers_rounded,
                isDark: isDark,
                title: 'Miligram App',
                desc: 'Digital tools for B2B accounting, secure supply chain management, and wealth services.',
              ),
              _EcosystemCard(
                icon: Icons.delivery_dining_rounded,
                isDark: isDark,
                title: 'Doorstep Services',
                desc: 'Secure, insured doorstep pickup and delivery for premium gold products and repair services.',
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
  final bool isDark;

  const _EcosystemCard({
    required this.icon, 
    required this.title, 
    required this.desc,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.gold.withOpacity(isDark ? 0.04 : 0.08),
        border: Border.all(color: AppColors.gold.withOpacity(isDark ? 0.15 : 0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.gold.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.gold, size: 32),
          ),
          const SizedBox(height: 32),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Hero',
              color: isDark ? AppColors.ivory : Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Hero',
              color: isDark ? AppColors.textMain : Colors.black.withOpacity(0.7),
              fontSize: 15,
              height: 1.6,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}



