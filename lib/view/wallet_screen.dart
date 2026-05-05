import 'package:flutter/material.dart';
import 'package:mdcat/view/payment_screen.dart';
import 'package:provider/provider.dart';
import 'package:mdcat/providers/wallet_provider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<WalletProvider>(context, listen: false).fetchWalletData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WalletProvider>(
      builder: (context, wp, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: wp.isLoading
                ? const Center(child: CircularProgressIndicator())
                : wp.errorMessage != null
                ? Center(child: Text(wp.errorMessage!))
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back Button
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(
                              context,
                            ); // Navigate back to Profile Screen
                          },
                        ),

                        Center(
                          child: _walletCard(
                            title: "Total  Credits",

                            value: "${wp.availableCredits} Coins",

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

                            value: "${wp.totalDeposits} PKR",

                            showButton: true,
                            height: 89,
                            smallButton: true,
                            buttonIcon: Icons.wallet,
                          ),
                        ),

                        const SizedBox(height: 20),
                        const Text(
                          "Recent History",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),

                        wp.usedTests.isEmpty
                            ? const Text("No used credits history found")
                            : Column(
                                children: wp.usedTests.map((item) {
                                  return _historyItem(
                                    item.subject,
                                    "${item.credits} Coins Used",
                                  );
                                }).toList(),
                              ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  // ✅ Wallet Card UI remains unchanged
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: smallButton
                ? Row(
                    children: [
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

                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const PaymentUploadScreen(),
                            //   ),
                            // );
                          },
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PaymentUploadScreen(),
                              ),
                            );
                          },
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

  // ✅ History item without date and level
  static Widget _historyItem(String subject, String usage) {
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
        ],
      ),
    );
  }
}
