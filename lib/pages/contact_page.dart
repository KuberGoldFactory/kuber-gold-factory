import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
        child: Center(
          child: Column(
            children: [
              Text(
                'CONTACT US',
                style: GoogleFonts.playfairDisplay(
                  color: AppColors.gold,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 60),
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                padding: const EdgeInsets.all(48),
                decoration: BoxDecoration(
                  color: AppColors.charcoal,
                  border: Border.all(color: AppColors.gold.withOpacity(0.5)),
                ),
                child: Column(
                  children: [
                    Text(
                      'Ready to discuss your requirements? Reach out to us directly for personalized service.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: AppColors.ivory,
                        fontSize: 18,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 48),
                    _ContactLink(
                      icon: Icons.call_rounded,
                      label: '+91 98765 43210',
                      onTap: () => launchUrl(Uri.parse('tel:+919876543210')),
                    ),
                    const SizedBox(height: 24),
                    _ContactLink(
                      icon: Icons.email_rounded,
                      label: 'info@kubergoldfactory.com',
                      onTap: () => launchUrl(Uri.parse('mailto:info@kubergoldfactory.com')),
                    ),
                    const SizedBox(height: 24),
                    _ContactLink(
                      icon: Icons.location_on_rounded,
                      label: '123 Industrial Hub, Mumbai, India',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactLink({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.gold, size: 24),
          const SizedBox(width: 16),
          Text(
            label,
            style: GoogleFonts.inter(
              color: AppColors.goldLight,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
