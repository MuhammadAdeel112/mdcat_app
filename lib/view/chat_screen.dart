import 'package:flutter/material.dart';
import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';
import 'package:mdcat/widgets/topgardientwithback.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  // Admin number in international format (no +, just country code + number)
  final String adminNumber = '923154522003'; // Example: Pakistan +92

  // Function to open WhatsApp
  Future<void> openWhatsApp(BuildContext context, String number) async {
    final whatsappUri = Uri.parse(
      "whatsapp://send?phone=$number&text=Hello Admin",
    );
    final waMeUri = Uri.parse("https://wa.me/$number?text=Hello Admin");

    // Try direct whatsapp:// first
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
      return;
    }

    // Fallback to wa.me
    if (await canLaunchUrl(waMeUri)) {
      await launchUrl(waMeUri, mode: LaunchMode.externalApplication);
      return;
    }

    // If neither works
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("WhatsApp is not installed.")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const TopGradientWithBack(),
          const SizedBox(height: 50),
          Center(
            child: ElevatedButton.icon(
              onPressed: () => openWhatsApp(context, adminNumber),
              icon: const Icon(Icons.chat),
              label: const Text("Chat with Admin"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 1),
    );
  }
}
