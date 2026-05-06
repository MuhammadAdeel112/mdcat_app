import 'package:flutter/material.dart';
import 'package:mdcat/view/Helpcenterscreen.dart';
import 'package:mdcat/view/Reportproblemscreen.dart';
import 'package:mdcat/view/wallet_screen.dart';
import 'package:provider/provider.dart';
import 'package:mdcat/providers/profile_provider.dart';
import 'package:mdcat/widgets/buildMenuItem.dart';
import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';
import 'package:mdcat/view/edit_profile_screen.dart';
import 'package:mdcat/view/security_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // ✅ Fetch profile on screen open
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().fetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const AppBottomNav(currentIndex: 3),
      body: profileProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  // ---------------- HEADER + AVATAR ----------------
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                        "assets/images/profileheader.png",
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: -50,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey.shade300,
                              // ✅ Show network image from API, fallback to asset
                              backgroundImage:
                                  profileProvider.profileImage.isNotEmpty
                                      ? NetworkImage(profileProvider.profileImage)
                                      : const AssetImage(
                                              "assets/images/userprofile.png")
                                          as ImageProvider,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditProfileScreen(),
                                    ),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/camera.png',
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // ✅ Name & Email from API
                  if (profileProvider.userName.isNotEmpty)
                    Text(
                      profileProvider.userName,
                      style: const TextStyle(
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF333333),
                      ),
                    ),
                  if (profileProvider.userEmail.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: Text(
                        profileProvider.userEmail,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                  // ✅ Coins badge
                  if (profileProvider.coins > 0)
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF492699).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFF492699)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.monetization_on,
                              color: Color(0xFF492699), size: 18),
                          const SizedBox(width: 6),
                          Text(
                            "${profileProvider.coins} Coins",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF492699),
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 12),

                  // ---------------- PROFILE OPTIONS ----------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MenuItem(
                        text: "Edit Profile",
                        icon: Icons.edit_outlined,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(),
                            ),
                          );
                        },
                      ),
                      MenuItem(
                        text: "Security",
                        icon: Icons.lock_outline,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SecurityScreen(),
                            ),
                          );
                        },
                      ),
                      MenuItem(
                        text: "Wallet",
                        icon: Icons.wallet,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WalletScreen()),
                          );
                        },
                      ),

                      // Help & Support
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          "Help & Support",
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ),
                      MenuItem(
                        text: "Help Center",
                        icon: Icons.help_outline,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HelpCenterScreen(),
                            ),
                          );
                        },
                      ),
                      MenuItem(
                        text: "Report a Problem",
                        icon: Icons.report_problem_outlined,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportProblemScreen(),
                            ),
                          );
                        },
                      ),

                      // Actions
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          "Actions",
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ),
                      MenuItem(
                        text: "Logout",
                        icon: Icons.logout,
                        textColor: const Color(0xFF333333),
                        iconColor: Colors.red,
                        onTap: () {
                          profileProvider.logout(context);
                        },
                      ),

                      const SizedBox(height: 80),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
