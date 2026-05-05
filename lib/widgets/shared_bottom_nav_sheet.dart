import 'package:flutter/material.dart';
// import 'package:mdcat/view/Score_screen.dart';
// import 'package:mdcat/view/chat_screen.dart';
// import 'package:mdcat/view/chat_screen.dart';
import 'package:mdcat/view/homescreen.dart';
// import 'package:mdcat/view/payment_screen.dart';
// import 'package:mdcat/view/payment_screen.dart';
import 'package:mdcat/view/profile_screen.dart';
import 'package:mdcat/view/score_history_screen.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:mdcat/view/wallet_screen.dart';
// import 'home_screen.dart';
// import 'profile_page.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  const AppBottomNav({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return; // already on this page

    if (index == 1) {
      // Chat icon tapped
      _showChatOptionsDialog(context);
      return;
    }

    Widget target;
    switch (index) {
      case 0:
        target = const HomeScreen();
        break;
      case 2:
        target = ScoreHistoryScreen();
        break;
      case 3:
        target = const ProfilePage();
        break;
      default:
        target = const HomeScreen();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => target),
    );
  }

  // New function to show dialog
  void _showChatOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6F46F0), Color(0xFF9C70F0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Choose Chat Option",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context); // close dialog
                    _openWhatsApp(context, '923154522003'); // Admin
                  },
                  icon: const Icon(Icons.admin_panel_settings),
                  label: const Text("Chat with Admin"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6F46F0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context); // close dialog
                    _openWhatsApp(context, '923001234567'); // Teacher number
                  },
                  icon: const Icon(Icons.person),
                  label: const Text("Chat with Teacher"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6F46F0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // WhatsApp opening function
  Future<void> _openWhatsApp(BuildContext context, String number) async {
    final whatsappUri = Uri.parse("whatsapp://send?phone=$number&text=Hello");
    final waMeUri = Uri.parse("https://wa.me/$number?text=Hello");

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
      return;
    }

    if (await canLaunchUrl(waMeUri)) {
      await launchUrl(waMeUri, mode: LaunchMode.externalApplication);
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("WhatsApp is not installed.")));
  }

  // void _onItemTapped(BuildContext context, int index) {
  //   if (index == currentIndex) return; // already on this page

  //   Widget target;
  //   switch (index) {
  //     case 0:
  //       target = const HomeScreen();
  //       break;
  //     case 1:
  //       target = ChatScreen();
  //       break;
  //     case 2:
  //       target = ScoreHistoryScreen();
  //       break;
  //     case 3:
  //       target = const ProfilePage();
  //       break;
  //     default:
  //       target = const HomeScreen();
  //   }

  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (_) => target),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white, // background goes here
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          side: const BorderSide(
            color: Color(0xFFCCCCCC), // border color
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors
            .transparent, // 🔑 makes sure the white bg doesn't override your border
        elevation: 0, // remove default shadow
        currentIndex: currentIndex,
        onTap: (i) => _onItemTapped(context, i),
        selectedItemColor: const Color(0xFF6F46F0),
        unselectedItemColor: const Color(0xFF9DA3AE),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            // icon: Icon(Icons.account_balance_wallet_rounded),
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: "Score",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
