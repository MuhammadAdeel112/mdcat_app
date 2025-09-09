import 'package:flutter/material.dart';
import 'package:mdcat/view/Score_screen.dart';
import 'package:mdcat/view/homescreen.dart';
import 'package:mdcat/view/payment_screen.dart';
import 'package:mdcat/view/profile_screen.dart';
// import 'package:mdcat/view/wallet_screen.dart';
// import 'home_screen.dart';
// import 'profile_page.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  const AppBottomNav({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return; // already on this page

    Widget target;
    switch (index) {
      case 0:
        target = const HomeScreen();
        break;
      case 1:
        target = PaymentUploadScreen();
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
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: "Wallet",
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
