// import 'package:flutter/material.dart';

// class PrivacyPolicyScreen extends StatelessWidget {
//   const PrivacyPolicyScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Privacy Policy'), centerTitle: true),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               Text(
//                 'Privacy Policy',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Your privacy is important to us. This app only accesses the following information for the stated purposes:\n\n'
//                 '• Camera: To upload profile pictures.\n'
//                 '• Storage: To save downloaded practice tests or reports.\n'
//                 '• Notifications: To remind you about upcoming tests.\n\n'
//                 'We do NOT share your information with any third party.',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

// Simple Privacy Policy Screen
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        centerTitle: true,
        backgroundColor: Color(0xFF8C59FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Your privacy is very important to us. This app only accesses the following information for the stated purposes:\n\n'
                '• Camera: To upload profile pictures.\n'
                '• Storage: To save downloaded practice tests or reports.\n'
                '• Notifications: To remind you about upcoming tests.\n\n'
                'We do NOT share your information with any third party. All data is securely stored and used only to enhance your app experience.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
