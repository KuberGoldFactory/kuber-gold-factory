import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _launchWhatsApp() async {
    final url = Uri.parse('https://wa.me/919922965494');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _submitInquiry() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    if (name.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in your name and message.')),
      );
      return;
    }

    final fullMessage = 'Hello Kuber Gold Factory,\n\nI would like to make an inquiry:\n\n*Name:* $name\n*Email:* ${email.isEmpty ? 'Not provided' : email}\n*Message:* $message';
    final url = Uri.parse('https://wa.me/919922965494?text=${Uri.encodeComponent(fullMessage)}');
    
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHero(context),
          _buildSupportSection(context),
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
              'GET IN TOUCH',
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
              'CONTACT OUR TEAM',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Hero',
                color: isDark ? AppColors.ivory : Colors.black,
                fontSize: MediaQuery.of(context).size.width < 600 ? 32 : 48,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportSection(BuildContext context) {
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
                    _buildTextField(context, 'Your Name', isDark, controller: _nameController),
                    const SizedBox(height: 20),
                    _buildTextField(context, 'Email Address', isDark, controller: _emailController),
                    const SizedBox(height: 20),
                    _buildTextField(context, 'Your Message', isDark, controller: _messageController, maxLines: 4),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: _submitInquiry,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.gold.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.gold, size: 24),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label, bool isDark, {required TextEditingController controller, int maxLines = 1}) {
    return TextField(
      controller: controller,
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
