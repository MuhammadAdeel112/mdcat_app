import 'package:flutter/material.dart';
import 'package:mdcat/view/edit_profile_screen.dart';
import 'package:mdcat/view/security_screen.dart';
import 'package:mdcat/widgets/buildMenuItem.dart';
import 'package:mdcat/widgets/shared_bottom_nav_sheet.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const AppBottomNav(currentIndex: 3),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header + Avatar
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
                  bottom: -50, // avatar overlaps header nicely
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                          "assets/images/userprofile.png",
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
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

                      // Positioned(
                      //   bottom: 0,
                      //   right: 0,
                      //   child: CircleAvatar(
                      //     radius: 14,
                      //     backgroundColor: Colors.white,
                      //     child: Image.asset(
                      //       'assets/images/camera.png', // Replace with your asset path
                      //       width: 20,
                      //       height: 20,
                      //       fit: BoxFit.contain,
                      //     ),
                      //   ),
                      // ),

                      // Positioned(
                      //   bottom: 0,
                      //   right: 0,
                      //   child: CircleAvatar(
                      //     radius: 14,
                      //     backgroundColor: Colors.white,
                      //     child: const Icon(
                      //       Icons.camera_alt,
                      //       size: 16,
                      //       color: Color(0xFF242760),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70), // ensures avatar is fully visible
            // Menu list
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // 👈 makes children align left
              children: [
                // buildMenuItem("Edit profile", Icons.edit_outlined),
                MenuItem(
                  text: "Edit profile",
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

                // buildMenuItem("Security", Icons.lock_outline),
                const Align(
                  alignment: Alignment.centerLeft, // 👈 force left
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Support & About",
                      style: TextStyle(
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 0.88,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                ),
                // buildMenuItem("Help & Support", Icons.help_outline),
                MenuItem(
                  text: "Help & Support",
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

                // buildMenuItem("Contact Teacher", Icons.mail_outline),
                MenuItem(
                  text: "Contact Teacher",
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

                const Align(
                  alignment: Alignment.centerLeft, // 👈 force left
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Actions",
                      style: TextStyle(
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 0.88,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                ),
                // buildMenuItem(
                //   "Report a problem",
                //   Icons.report_problem_outlined,
                // ),
                MenuItem(
                  text: "Report a problem",
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

                // buildMenuItem("Log out", Icons.logout),
                // buildMenuItem(
                //   "Log out",
                //   Icons.logout,
                //   textColor: Color(0xFF333333), // black text
                //   iconColor: Colors.red, // red icon
                // ),
                MenuItem(
                  text: "Log out",
                  icon: Icons.logout,
                  textColor: Color(0xFF333333), // black text
                  iconColor: Colors.red,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecurityScreen(),
                      ),
                    );
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

//   Widget buildMenuItem(
//     String text,
//     IconData icon, {
//     Color textColor = const Color(0xFF333333), // default: #333333 for text
//     Color iconColor = const Color(0xFF333333), // default: purple for icon
//   }) {
//     return ListTile(
//       leading: Icon(
//         icon,
//         color: iconColor, // 👈 separate icon color
//       ),
//       title: Text(
//         text,
//         style: TextStyle(
//           color: textColor, // 👈 separate text color
//           fontSize: 16,
//         ),
//       ),
//       trailing: const Icon(
//         Icons.chevron_right, // bold style
//         size: 24,
//         color: Color(0xFF8C59FF),
//       ),
//       onTap: () {},
//     );
//   }
// }
