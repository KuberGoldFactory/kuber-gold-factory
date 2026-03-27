import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Future<void> _launchWhatsApp() async {
    final url = Uri.parse('https://wa.me/919922965494');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHero(),
          _buildContactContent(context),
        ],
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      height: 300,
      width: double.infinity,
      color: AppColors.obsidian,
      child: Center(
        child: Text(
          'CONNECT WITH US',
          style: GoogleFonts.playfairDisplay(
            color: AppColors.ivory,
            fontSize: 48,
            fontWeight: FontWeight.w900,
            letterSpacing: 4,
          ),
        ),
      ),
    );
  }

  Widget _buildContactContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      color: AppColors.charcoal,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Wrap(
            spacing: 80,
            runSpacing: 60,
            alignment: WrapAlignment.center,
            children: [
              // Contact Methods
              SizedBox(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DIRECT SUPPORT',
                      style: GoogleFonts.playfairDisplay(
                        color: AppColors.gold,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildContactMethod(
                      icon: Icons.chat_bubble_outline_rounded,
                      title: 'WhatsApp Chat',
                      content: '+91 9922965494',
                      onTap: _launchWhatsApp,
                    ),
                    const SizedBox(height: 40),
                    _buildContactMethod(
                      icon: Icons.location_on_outlined,
                      title: 'Factory Location',
                      content: 'Akot, Dist. Akola, Maharashtra',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              // Inquiry Form
              SizedBox(
                width: 450,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SEND AN INQUIRY',
                      style: GoogleFonts.playfairDisplay(
                        color: AppColors.gold,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildTextField('Your Name'),
                    const SizedBox(height: 20),
                    _buildTextField('Email Address'),
                    const SizedBox(height: 20),
                    _buildTextField('Your Message', maxLines: 4),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.gold,
                          foregroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(),
                        ),
                        child: Text(
                          'SUBMIT INQUIRY',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
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

  Widget _buildContactMethod({required IconData icon, required String title, required String content, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.gold, size: 32),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.playfairDisplay(
                  color: AppColors.ivory,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: GoogleFonts.inter(
                  color: AppColors.textMuted,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.textMuted),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.charcoal),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.gold),
        ),
        filled: true,
        fillColor: AppColors.darkCard,
      ),
    );
  }
}

