import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/site_scaffold.dart';

class DoorstepServicesPage extends StatelessWidget {
  const DoorstepServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHero(context),
          _buildContent(context),
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
              'SECURE LOGISTICS',
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
              'DOORSTEP SERVICES',
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

  Widget _buildContent(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: isDark ? AppColors.charcoal : Colors.black.withOpacity(0.02),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.gold.withOpacity(0.1),
                  border: Border.all(color: AppColors.gold.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline_rounded, color: AppColors.gold, size: 32),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CURRENTLY ON TRIAL',
                            style: TextStyle(
                              fontFamily: 'Hero',
                              color: isDark ? AppColors.ivory : Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Doorstep service is on trial in a few areas in Pune. Please confirm availability with our team before placing your order. We will reach your location soon.',
                            style: TextStyle(
                              fontFamily: 'Hero',
                              color: isDark ? AppColors.textMuted : Colors.black87,
                              fontSize: 15,
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              Text(
                'Premium Logistics Tailored for the Gold Industry',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Hero',
                  color: isDark ? AppColors.ivory : Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Our white-glove logistic service is engineered exclusively for B2B jewellers and manufacturers. We provide secure, insured, and GPS-tracked doorstep pickup and delivery for premium gold products, raw materials, and precision repair jobs.\n\nEvery transfer is handled by highly vetted, armed logisticians to ensure absolute zero-compromise security from our factory vault directly into your hands.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Hero',
                  color: isDark ? AppColors.textMuted : Colors.black.withOpacity(0.7),
                  fontSize: 16,
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
}
