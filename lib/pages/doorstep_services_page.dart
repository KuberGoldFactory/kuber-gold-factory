import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';

class DoorstepServicesPage extends StatelessWidget {
  const DoorstepServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
              'ELITE LOGISTICS',
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
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: AppColors.gold.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.gold.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      color: AppColors.gold,
                      size: 48,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'SERVICE TRIAL NOTICE',
                      style: TextStyle(
                        fontFamily: 'Hero',
                        color: AppColors.gold,
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'We are delivering this service in few places in area as on trial. Confirm before order.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Hero',
                        color: isDark ? AppColors.ivory : Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              Text(
                'Our doorstep services include secure, insured pickup and delivery for premium gold products, repairing, and polishing services. We aim to bring the showroom experience to the comfort of your home.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Hero',
                  color: isDark ? AppColors.textMuted : Colors.black.withOpacity(0.7),
                  fontSize: 16,
                  height: 1.8,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton.icon(
                onPressed: () => _launchWhatsApp(),
                icon: const Icon(Icons.support_agent_rounded),
                label: const Text('CONFIRM VIA CHAT SUPPORT'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gold,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  textStyle: const TextStyle(
                    fontFamily: 'Hero',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Please chat with our support team to check availability in your area before scheduling a service.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Hero',
                  color: isDark ? AppColors.textMuted : Colors.black.withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchWhatsApp() async {
    final url = Uri.parse('https://wa.me/919922965494?text=Hello%20Kuber%20Gold%20Factory%2C%20I%20would%20like%20to%20confirm%20availability%20for%20Doorstep%20Services.');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}
