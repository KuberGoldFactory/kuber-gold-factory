import 'package:flutter/material.dart';
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
          _buildHero(context),
          _buildContactContent(context),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      height: 300,
      width: double.infinity,
      color: isDark ? AppColors.obsidian : AppColors.ivory,
      child: Center(
        child: Text(
          'CONNECT WITH US',
          style: TextStyle(
            fontFamily: 'Hero',
            color: isDark ? AppColors.ivory : Colors.black87,
            fontSize: 48,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildContactContent(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      color: isDark ? AppColors.charcoal : AppColors.ivory,
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
                    const Text(
                      'DIRECT SUPPORT',
                      style: TextStyle(
                        fontFamily: 'Hero',
                        color: AppColors.gold,
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildContactMethod(
                      isDark: isDark,
                      icon: Icons.chat_bubble_outline_rounded,
                      title: 'WhatsApp Chat',
                      content: '+91 9922965494',
                      onTap: _launchWhatsApp,
                    ),
                    const SizedBox(height: 40),
                    _buildContactMethod(
                      isDark: isDark,
                      icon: Icons.location_on_outlined,
                      title: 'Factory Location',
                      content: 'GROUND FLOOR, HOUSE NO-97, WALKHAD\nMAHULI-VEGEGAON ROAD, NEAR BUS STAND\nKHANAPUR, SANGLI. (415310)',
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
                    const Text(
                      'SEND AN INQUIRY',
                      style: TextStyle(
                        fontFamily: 'Hero',
                        color: AppColors.gold,
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildTextField(context, 'Your Name', isDark),
                    const SizedBox(height: 20),
                    _buildTextField(context, 'Email Address', isDark),
                    const SizedBox(height: 20),
                    _buildTextField(context, 'Your Message', isDark, maxLines: 4),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.gold,
                          foregroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text(
                          'SUBMIT INQUIRY',
                          style: TextStyle(
                            fontFamily: 'Hero',
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                            fontSize: 15,
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

  Widget _buildContactMethod({
    required bool isDark,
    required IconData icon, 
    required String title, 
    required String content, 
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.gold.withOpacity(isDark ? 0.04 : 0.08),
          border: Border.all(color: AppColors.gold.withOpacity(isDark ? 0.1 : 0.2)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.gold, size: 28),
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Hero',
                    color: isDark ? AppColors.ivory : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: TextStyle(
                    fontFamily: 'Hero',
                    color: isDark ? AppColors.textMain : Colors.black.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label, bool isDark, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: 'Hero',
        color: isDark ? Colors.white : Colors.black,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: 'Hero',
          color: isDark ? AppColors.textMuted : Colors.black.withOpacity(0.6),
          fontSize: 13,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.gold.withOpacity(isDark ? 0.15 : 0.3)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.gold),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: AppColors.gold.withOpacity(isDark ? 0.04 : 0.08),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    );
  }
}



