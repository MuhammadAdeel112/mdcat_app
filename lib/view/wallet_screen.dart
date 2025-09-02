import 'package:flutter/material.dart';
import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const AppBottomNav(currentIndex: 1),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: _walletCard(
                  title: "Balance",
                  value: "569,236 PKR",
                  showButton: true,
                  height: 149,
                  buttonText: "Buy Credits",
                  buttonIcon: Icons.add_card_outlined,
                ),
              ),
              const SizedBox(height: 12),

              Center(
                child: _walletCard(
                  title: "Total Deposit",
                  value: "12492 PKR",
                  showButton: true,
                  height: 89,
                  smallButton: true, // 👈 enables small button mode
                  buttonIcon: Icons.wallet, // or withdraw icon
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                "Recent History",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              _historyItem("Math", "200 Coins Used", "22 June 2025"),
              _historyItem("English", "200 Coins Used", "22 June 2025"),
              _historyItem("Chemistry", "200 Coins Used", "22 June 2025"),
              _historyItem("Biology", "200 Coins Used", "22 June 2025"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _walletCard({
    required String title,
    required String value,
    required bool showButton,
    required double height,
    String? buttonText,
    IconData? buttonIcon,
    bool smallButton = false,
  }) {
    return Container(
      width: 315,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(18, 62, 100, 1),
            Color.fromRGBO(53, 78, 147, 1),
            Color.fromRGBO(96, 103, 197, 1),
            Color.fromRGBO(170, 127, 248, 1),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Stack(
        children: [
          // 🔵 background circles
          Positioned(
            top: 1,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            right: -20,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          Positioned(
            top: 1,
            right: -40,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.06),
              ),
            ),
          ),

          // 👇 content (row or column depending on card type)
          Padding(
            padding: const EdgeInsets.all(16),
            child: smallButton
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // small circle button
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: IconButton(
                          icon: Icon(
                            buttonIcon ?? Icons.arrow_forward,
                            color: Colors.black,
                            size: 20,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        value,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (showButton) ...[
                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: Icon(
                            buttonIcon ?? Icons.add_card_outlined,
                            size: 18,
                          ),
                          label: Text(buttonText ?? "Buy Credits"),
                        ),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  static Widget _historyItem(String subject, String usage, String date) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFCCCCCC)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  usage,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(color: Color(0xFF333333), fontSize: 13),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF8C59FF),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "Level 1",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
