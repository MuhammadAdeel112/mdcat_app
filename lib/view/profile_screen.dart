// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:mdcat/providers/profile_provider.dart';
// import 'package:mdcat/widgets/buildMenuItem.dart';
// import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';
// import 'package:mdcat/view/edit_profile_screen.dart';
// import 'package:mdcat/view/security_screen.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final profileProvider = context.watch<ProfileProvider>();

//     return Scaffold(
//       backgroundColor: Colors.white,
//       bottomNavigationBar: const AppBottomNav(currentIndex: 3),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Header + Avatar
//             Stack(
//               alignment: Alignment.center,
//               clipBehavior: Clip.none,
//               children: [
//                 Image.asset(
//                   "assets/images/profileheader.png",
//                   width: double.infinity,
//                   height: 180,
//                   fit: BoxFit.cover,
//                 ),
//                 Positioned(
//                   bottom: -50,
//                   child: Stack(
//                     children: [
//                       CircleAvatar(
//                         radius: 60,
//                         backgroundImage: AssetImage(
//                           profileProvider.profileImage,
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: GestureDetector(
//                           onTap: () {
//                             // Example: update image (mock)
//                             profileProvider.updateProfileImage(
//                               "assets/images/newuserprofile.png",
//                             );
//                           },
//                           child: CircleAvatar(
//                             radius: 14,
//                             backgroundColor: Colors.white,
//                             child: ClipOval(
//                               child: Image.asset(
//                                 'assets/images/camera.png',
//                                 width: 20,
//                                 height: 20,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 70),

//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 MenuItem(
//                   text: "Edit profile",
//                   icon: Icons.edit_outlined,
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => EditProfileScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 MenuItem(
//                   text: "Security",
//                   icon: Icons.lock_outline,
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const SecurityScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     child: Text(
//                       "Actions",
//                       style: TextStyle(
//                         fontFamily: 'Lexend',
//                         fontWeight: FontWeight.w500,
//                         fontSize: 16,
//                         height: 0.88,
//                         color: Color(0xFF333333),
//                       ),
//                     ),
//                   ),
//                 ),
//                 MenuItem(
//                   text: "Log out",
//                   icon: Icons.logout,
//                   textColor: Color(0xFF333333),
//                   iconColor: Colors.red,
//                   onTap: () {
//                     profileProvider.logout(
//                       context,
//                     ); // ✅ Now works with splash screen
//                   },
//                 ),

//                 // MenuItem(
//                 //   text: "Log out",
//                 //   icon: Icons.logout,
//                 //   textColor: Color(0xFF333333),
//                 //   iconColor: Colors.red,
//                 //   onTap: () {
//                 //     profileProvider.logout(context);
//                 //   },
//                 // ),
//                 const SizedBox(height: 80),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
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

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const AppBottomNav(currentIndex: 3),
      body: SingleChildScrollView(
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
                        backgroundImage: AssetImage(
                          profileProvider.profileImage,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            profileProvider.updateProfileImage(
                              "assets/images/newuserprofile.png",
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

            const SizedBox(height: 70),

            // ---------------- PROFILE OPTIONS ----------------
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Edit Profile
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

                // Security
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
                  text: "Wallet ",
                  icon: Icons.wallet,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WalletScreen()),
                    );
                  },
                ),

                // ---------------- HELP & SUPPORT SECTION ----------------
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                    // Open Help Center Screen
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
                    // Open Report a Problem Screen or show dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportProblemScreen(),
                      ),
                    );
                  },
                ),

                // ---------------- ACTIONS SECTION ----------------
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
