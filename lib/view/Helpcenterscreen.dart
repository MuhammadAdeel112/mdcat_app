// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class HelpCenterScreen extends StatelessWidget {
//   const HelpCenterScreen({super.key});

//   // Sample FAQs for MDCAT
//   final List<Map<String, String>> faqs = const [
//     {
//       'question': 'How many questions are in a practice test?',
//       'answer': 'Each practice test contains 50 multiple-choice questions.',
//     },
//     {
//       'question': 'Can I review answers after submission?',
//       'answer': 'Yes, you can review your answers in the Results section.',
//     },
//     {
//       'question': 'How is the test timer managed?',
//       'answer':
//           'The timer starts as soon as you begin the test and stops automatically at the end.',
//     },
//     {
//       'question': 'Can I retake a test?',
//       'answer': 'Yes, you can attempt any practice test multiple times.',
//     },
//   ];

//   // Function to launch email for contact
//   void _contactSupport() async {
//     final Uri emailLaunchUri = Uri(
//       scheme: 'mailto',
//       path: 'support@mdcatapp.com',
//       query: 'subject=Help Center Inquiry',
//     );
//     if (await canLaunchUrl(emailLaunchUri)) {
//       await launchUrl(emailLaunchUri);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Help Center'), centerTitle: true),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const Text(
//               'Welcome to the Help Center. Here you can find answers to frequently asked questions and contact support if needed.',
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: faqs.length,
//                 itemBuilder: (context, index) {
//                   return ExpansionTile(
//                     title: Text(
//                       faqs[index]['question']!,
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(faqs[index]['answer']!),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//             ElevatedButton.icon(
//               onPressed: _contactSupport,
//               icon: const Icon(Icons.email),
//               label: const Text('Contact Support'),
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                   vertical: 12,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mdcat/widgets/custom_background.dart'; // CustomHeader import

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  // Sample FAQs for MDCAT
  final List<Map<String, String>> faqs = const [
    {
      'question': 'How many questions are in a practice test?',
      'answer': 'Each practice test contains 50 multiple-choice questions.',
    },
    {
      'question': 'Can I review answers after submission?',
      'answer': 'Yes, you can review your answers in the Results section.',
    },
    {
      'question': 'How is the test timer managed?',
      'answer':
          'The timer starts as soon as you begin the test and stops automatically at the end.',
    },
    {
      'question': 'Can I retake a test?',
      'answer': 'Yes, you can attempt any practice test multiple times.',
    },
  ];

  // Function to launch email for contact
  void _contactSupport() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@mdcatapp.com',
      query: 'subject=Help Center Inquiry',
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ✅ Custom Header (same as Report Problem screen)
          CustomHeader(
            title: "Help Center",
            counterText: "",
            onBack: () {
              Navigator.pop(context);
            },
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Welcome to the Help Center. Here you can find answers to frequently asked questions and contact support if needed.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: faqs.length,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          title: Text(
                            faqs[index]['question']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(faqs[index]['answer']!),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _contactSupport,
                    icon: const Icon(Icons.email),
                    label: const Text('Contact Support'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
