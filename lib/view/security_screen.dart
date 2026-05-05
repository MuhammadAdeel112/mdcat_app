// // import 'package:flutter/material.dart';
// // import 'package:mdcat/view/Privacypolicyscreen.dart';
// // // import 'package:url_launcher/url_launcher.dart';

// // class SecurityScreen extends StatelessWidget {
// //   const SecurityScreen({super.key});

// //   // Sample permissions list
// //   final List<Map<String, String>> permissions = const [
// //     {
// //       'title': 'Camera Access',
// //       'description': 'Needed to upload your profile picture.',
// //     },
// //     {
// //       'title': 'Storage Access',
// //       'description': 'Needed to save downloaded practice tests or reports.',
// //     },
// //     {
// //       'title': 'Email Access',
// //       'description': 'Needed to send notifications and test results.',
// //     },
// //     {
// //       'title': 'Notification Access',
// //       'description':
// //           'Needed to remind you about upcoming tests and important updates.',
// //     },
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Security & Permissions'),
// //         centerTitle: true,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             const Text(
// //               'This section shows what information and permissions our app accesses from your device.',
// //               style: TextStyle(fontSize: 16),
// //             ),
// //             const SizedBox(height: 20),
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: permissions.length,
// //                 itemBuilder: (context, index) {
// //                   return ListTile(
// //                     leading: const Icon(Icons.lock_outline),
// //                     title: Text(permissions[index]['title']!),
// //                     subtitle: Text(permissions[index]['description']!),
// //                   );
// //                 },
// //               ),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => const PrivacyPolicyScreen(),
// //                   ),
// //                 );
// //               },
// //               child: const Text(
// //                 'View Privacy Policy',
// //                 style: TextStyle(decoration: TextDecoration.underline),
// //               ),
// //             ),

// //             // TextButton(
// //             //   onPressed: _openPrivacyPolicy,
// //             //   child: const Text(
// //             //     'View Privacy Policy',
// //             //     style: TextStyle(decoration: TextDecoration.underline),
// //             //   ),
// //             // ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:mdcat/view/Privacypolicyscreen.dart';

// class SecurityScreen extends StatelessWidget {
//   const SecurityScreen({super.key});

//   // Sample permissions list
//   final List<Map<String, dynamic>> permissions = const [
//     {
//       'icon': Icons.camera_alt,
//       'title': 'Camera Access',
//       'description': 'Needed to upload your profile picture.',
//     },
//     {
//       'icon': Icons.storage,
//       'title': 'Storage Access',
//       'description': 'Needed to save downloaded practice tests or reports.',
//     },
//     {
//       'icon': Icons.email,
//       'title': 'Email Access',
//       'description': 'Needed to send notifications and test results.',
//     },
//     {
//       'icon': Icons.notifications,
//       'title': 'Notification Access',
//       'description': 'Needed to remind you about upcoming tests and updates.',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Security & Permissions'),
//         centerTitle: true,
//         backgroundColor: Color(0xFF8C59FF),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const Text(
//               'We value your privacy! Here’s what our app accesses from your device and why.',
//               style: TextStyle(fontSize: 16),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: permissions.length,
//                 itemBuilder: (context, index) {
//                   final item = permissions[index];
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     elevation: 4,
//                     margin: const EdgeInsets.symmetric(vertical: 10),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor: Colors.deepPurple.shade100,
//                         child: Icon(item['icon'], color: Color(0xFF8C59FF)),
//                       ),
//                       title: Text(
//                         item['title'],
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       subtitle: Text(item['description']),
//                       trailing: const Icon(Icons.arrow_forward_ios, size: 18),
//                       onTap: () {
//                         // Optional: show more info on tap
//                         showDialog(
//                           context: context,
//                           builder: (context) => AlertDialog(
//                             title: Text(item['title']),
//                             content: Text(item['description']),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: const Text('Close'),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),

//             // Attractive Privacy Policy button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const PrivacyPolicyScreen(),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF8C59FF),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: const Text(
//                   'View Privacy Policy',
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:mdcat/view/Privacypolicyscreen.dart';
// import 'package:mdcat/widgets/custom_background.dart'; // Make sure CustomHeader is imported

// class SecurityScreen extends StatelessWidget {
//   const SecurityScreen({super.key});

//   final List<Map<String, dynamic>> permissions = const [
//     {
//       'icon': Icons.camera_alt,
//       'title': 'Camera Access',
//       'description': 'Needed to upload your profile picture.',
//     },
//     {
//       'icon': Icons.storage,
//       'title': 'Storage Access',
//       'description': 'Needed to save downloaded practice tests or reports.',
//     },
//     {
//       'icon': Icons.email,
//       'title': 'Email Access',
//       'description': 'Needed to send notifications and test results.',
//     },
//     {
//       'icon': Icons.notifications,
//       'title': 'Notification Access',
//       'description': 'Needed to remind you about upcoming tests and updates.',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           // Custom header instead of AppBar
//           CustomHeader(
//             title: "Security & Permissions",
//             counterText: "",
//             onBack: () {
//               Navigator.pop(context);
//             },
//           ),

//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   const Text(
//                     'We value your privacy! Here’s what our app accesses from your device and why.',
//                     style: TextStyle(fontSize: 16),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 20),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: permissions.length,
//                       itemBuilder: (context, index) {
//                         final item = permissions[index];
//                         return Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           elevation: 4,
//                           margin: const EdgeInsets.symmetric(vertical: 10),
//                           child: ListTile(
//                             leading: CircleAvatar(
//                               backgroundColor: Colors.deepPurple.shade100,
//                               child: Icon(
//                                 item['icon'],
//                                 color: Color(0xFF8C59FF),
//                               ),
//                             ),
//                             title: Text(
//                               item['title'],
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             subtitle: Text(item['description']),
//                             trailing: const Icon(
//                               Icons.arrow_forward_ios,
//                               size: 18,
//                             ),
//                             onTap: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (context) => AlertDialog(
//                                   title: Text(item['title']),
//                                   content: Text(item['description']),
//                                   actions: [
//                                     TextButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       child: const Text('Close'),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         );
//                       },
//                     ),
//                   ),

//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const PrivacyPolicyScreen(),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF8C59FF),
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: const Text(
//                         'View Privacy Policy',
//                         style: TextStyle(fontSize: 18, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mdcat/view/Privacypolicyscreen.dart';
import 'package:mdcat/widgets/custom_background.dart'; // Make sure CustomHeader is imported

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  final List<Map<String, dynamic>> permissions = const [
    {
      'icon': Icons.camera_alt,
      'title': 'Camera Access',
      'description': 'Needed to upload your profile picture.',
    },
    {
      'icon': Icons.storage,
      'title': 'Storage Access',
      'description': 'Needed to save downloaded practice tests or reports.',
    },
    {
      'icon': Icons.email,
      'title': 'Email Access',
      'description': 'Needed to send notifications and test results.',
    },
    {
      'icon': Icons.notifications,
      'title': 'Notification Access',
      'description': 'Needed to remind you about upcoming tests and updates.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom header instead of AppBar
          CustomHeader(
            title: "Security & Permissions",
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
                    'We value your privacy! Here’s what our app accesses from your device and why.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: permissions.length,
                      itemBuilder: (context, index) {
                        final item = permissions[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.deepPurple.shade100,
                              child: Icon(
                                item['icon'],
                                color: Color(0xFF8C59FF),
                              ),
                            ),
                            title: Text(
                              item['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(item['description']),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            ),

                            // onTap: () {
                            //   showDialog(
                            //     context: context,
                            //     builder: (context) => Dialog(
                            //       backgroundColor: Colors.transparent,
                            //       insetPadding: const EdgeInsets.all(20),
                            //       child: Stack(
                            //         clipBehavior: Clip.none,
                            //         children: [
                            //           Container(
                            //             width: 350,
                            //             height:
                            //                 220, // Increased height to fit button
                            //             decoration: BoxDecoration(
                            //               color: Colors.white,
                            //               borderRadius: BorderRadius.circular(
                            //                 16,
                            //               ),
                            //             ),
                            //             padding: const EdgeInsets.all(24),
                            //             child: Column(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.center,
                            //               children: [
                            //                 Text(
                            //                   item['title'],
                            //                   textAlign: TextAlign.center,
                            //                   style: const TextStyle(
                            //                     color: Color(0xFF793FFF),
                            //                     fontWeight: FontWeight.bold,
                            //                     fontSize: 20,
                            //                   ),
                            //                 ),
                            //                 const SizedBox(height: 16),
                            //                 Text(
                            //                   item['description'],
                            //                   textAlign: TextAlign.center,
                            //                   style: const TextStyle(
                            //                     color: Color(0xB2000000),
                            //                     fontSize: 16,
                            //                   ),
                            //                 ),
                            //                 const SizedBox(height: 20),
                            //                 SizedBox(
                            //                   width: double.infinity,
                            //                   child: ElevatedButton(
                            //                     onPressed: () {
                            //                       Navigator.pop(context);
                            //                     },
                            //                     style: ElevatedButton.styleFrom(
                            //                       backgroundColor: Color(
                            //                         0xFF8C59FF,
                            //                       ),
                            //                       padding:
                            //                           const EdgeInsets.symmetric(
                            //                             vertical: 12,
                            //                           ),
                            //                       shape: RoundedRectangleBorder(
                            //                         borderRadius:
                            //                             BorderRadius.circular(
                            //                               12,
                            //                             ),
                            //                       ),
                            //                     ),
                            //                     child: const Text(
                            //                       'Close',
                            //                       style: TextStyle(
                            //                         fontSize: 16,
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //           Positioned(
                            //             top: -40,
                            //             left: -40,
                            //             child: Container(
                            //               width: 80,
                            //               height: 80,
                            //               decoration: const BoxDecoration(
                            //                 color: Color(0x14793FFF),
                            //                 shape: BoxShape.circle,
                            //               ),
                            //             ),
                            //           ),
                            //           Positioned(
                            //             bottom: -40,
                            //             right: -40,
                            //             child: Container(
                            //               width: 80,
                            //               height: 80,
                            //               decoration: const BoxDecoration(
                            //                 color: Color(0x14793FFF),
                            //                 shape: BoxShape.circle,
                            //               ),
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   );
                            // },
                            onTap: () {
                              // New dialog design
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding: const EdgeInsets.all(20),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 300,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(24),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              item['title'],
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Color(0xFF793FFF),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            Text(
                                              item['description'],
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Color(0xB2000000),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: -40,
                                        left: -40,
                                        child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: const BoxDecoration(
                                            color: Color(0x14793FFF),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -40,
                                        right: -40,
                                        child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: const BoxDecoration(
                                            color: Color(0x14793FFF),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8C59FF),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'View Privacy Policy',
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
