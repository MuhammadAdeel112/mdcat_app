import 'package:flutter/material.dart';
import 'package:mdcat/providers/gender_provider.dart';
import 'package:mdcat/view/loginscreen.dart';
import 'package:provider/provider.dart';
// import 'gender_provider.dart';
// import 'next_screen.dart';

class GenderSelectionScreen extends StatelessWidget {
  const GenderSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final genderProvider = Provider.of<GenderProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFFFFF7F2),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
              offset: const Offset(0, -70),
              child: Text(
                "Select Your Gender Please",
                textAlign: TextAlign.center, // Center alignment
                style: TextStyle(
                  fontFamily: 'Lexend', // Font family
                  fontWeight: FontWeight.w500, // Weight 500
                  fontSize: 22, // Font size 22
                  height: 1.5, // Line height 150%
                  letterSpacing: 0, // Letter spacing
                  color: Color(0xFF333333), // Text color
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Avatar
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40000000), // #00000040 with 25% opacity
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 80,
                child: ClipOval(
                  child: Image.asset(
                    genderProvider.selectedGender == "Male"
                        ? "assets/images/genderboy.png"
                        : "assets/images/gendergirl.png",
                    fit: BoxFit.cover,
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
            ),

            // CircleAvatar(
            //   radius: 80,
            //   child: ClipOval(
            //     child: Image.asset(
            //       genderProvider.selectedGender == "Male"
            //           ? "assets/images/genderboy.png"
            //           : "assets/images/gendergirl.png",
            //       fit: BoxFit.cover,
            //       width: 250,
            //       height: 250,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 16),

            // Gender Text
            Text(
              genderProvider.selectedGender,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            // Radio buttons
            Transform.translate(
              offset: const Offset(0, 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: "Male",
                    groupValue: genderProvider.selectedGender,
                    onChanged: (v) {
                      genderProvider.setGender(v!);
                    },
                  ),
                  const Text("Male"),
                  const SizedBox(width: 70),
                  Radio<String>(
                    value: "Female",
                    groupValue: genderProvider.selectedGender,
                    onChanged: (v) {
                      genderProvider.setGender(v!);
                    },
                  ),
                  const Text("Female"),
                ],
              ),
            ),

            // Done Button
            Transform.translate(
              offset: const Offset(0, 140),
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF8C59FF), // #8C59FF
                      Color(0xFF492699), // #492699
                    ],
                    stops: [0.3723, 1.0], // Approximate the percentages
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .transparent, // Important to keep gradient visible
                    shadowColor: Colors.transparent, // Remove shadow if needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(double.infinity, 55),
                  ),
                  child: const Text(
                    "Done",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Set text color to white
                    ),
                  ),

                  // child: const Text(
                  //   "Done",
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,)),
                ),
              ),
            ),

            //
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (_) => const LoginScreen()),
            //     );
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.deepPurple,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(30),
            //     ),
            //     minimumSize: const Size(double.infinity, 55),
            //   ),
            //   child: const Text(
            //     "Done",
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
