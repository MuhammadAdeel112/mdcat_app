// with dotted border dependency

// import 'package:flutter/material.dart';
// import 'package:dotted_border/dotted_border.dart';

// class PaymentUploadScreen extends StatelessWidget {
//   const PaymentUploadScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // 🔙 Back button
//               Row(
//                 children: [
//                   Container(
//                     width: 36,
//                     height: 36,
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade200,
//                       shape: BoxShape.circle,
//                     ),
//                     child: IconButton(
//                       icon: const Icon(Icons.arrow_back_ios_new,
//                           size: 16, color: Colors.black87),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),

//               // 📝 Title & Instructions
//               RichText(
//                 text: TextSpan(
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   children: [
//                     TextSpan(
//                       text: "Instructions ",
//                       style: TextStyle(color: Color(0xFF7B3EFF)),
//                     ),
//                     TextSpan(text: "for Payements"),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 12),
//               const Text(
//                 "Lorem ipsum dolor sit amet consectetur. Quam varius tortor aliquam habitant. "
//                 "Lorem ipsum dolor sit amet consectetur. Quam varius tortor aliquam habitant. "
//                 "See Example",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.black54,
//                   height: 1.4,
//                 ),
//               ),
//               const SizedBox(height: 24),

//               // 📂 Upload File row
//               Row(
//                 children: [
//                   const Icon(Icons.file_upload_outlined,
//                       color: Colors.black87, size: 22),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       "Upload file",
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 6),
//               const Text(
//                 "Move your files to the frame below or select from Device",
//                 style: TextStyle(
//                   fontSize: 13,
//                   color: Colors.black54,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // 🖼 Upload Screenshot Box
//               Center(
//                 child: DottedBorder(
//                   color: const Color(0xFF7B3EFF),
//                   strokeWidth: 1.2,
//                   dashPattern: const [6, 4],
//                   borderType: BorderType.RRect,
//                   radius: const Radius.circular(12),
//                   child: Container(
//                     width: double.infinity,
//                     height: 160,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(Icons.cloud_upload_outlined,
//                             size: 40, color: Colors.black54),
//                         const SizedBox(height: 8),
//                         const Text(
//                           "Upload Payment Screenshot",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         const Text(
//                           "Jpeg, Png, Pdf File ( maximum file size is 10MB )",
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.black54,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 14),
//                         ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF7B3EFF),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 24, vertical: 10),
//                           ),
//                           child: const Text(
//                             "Upload file",
//                             style: TextStyle(color: Colors.white, fontSize: 14),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//               const Spacer(),

//               // ✅ Verify Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF7B3EFF),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                   ),
//                   child: const Text(
//                     "Verify",
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//without dependency

import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class PaymentUploadScreen extends StatelessWidget {
  const PaymentUploadScreen({super.key});

  static const Color purple = Color(0xFF7B3EFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Color(0x0F8C59FF),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 16,
                        color: Colors.black87,
                      ),
                      onPressed: () => Navigator.maybePop(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Title: "Instructions for Payements" (with purple word)
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "lexend",
                  ),

                  children: [
                    TextSpan(
                      text: "Instructions ",
                      style: TextStyle(
                        color: Color(0xFF8C59FF),
                        fontFamily: "lexend",
                      ),
                      // color: PaymentUploadScreen.purple),
                    ),
                    TextSpan(text: "for Payements"),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: const Text(
                  "Lorem ipsum dolor sit amet consectetur. Quam varius tortor aliquam habitant. "
                  "Lorem ipsum dolor sit amet consectetur. Quam varius tortor aliquam habitant. "
                  "See Example",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xCC333333),
                    height: 1.4,
                    fontFamily: 'lexend',
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Upload File row
              Row(
                children: const [
                  Icon(
                    Icons.upload_file_outlined,
                    color: Colors.black87,
                    size: 22,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Upload file",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                "Move your files to the frame below or select from Device",
                style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
              ),
              const SizedBox(height: 40),

              // ---- Custom dashed upload box (replaces DottedBorder) ----
              // ClipRRect to keep rounded corners for both contents and dashed border
              Center(
                child: CustomPaint(
                  size: const Size(
                    double.infinity,
                    160,
                  ), // 👈 force it to paint a box
                  painter: const DashedRRectPainter(
                    color: PaymentUploadScreen.purple,
                    strokeWidth: 1.2,
                    dashWidth: 6,
                    dashGap: 4,
                    radius: 12,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 160,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.cloud_upload_outlined,
                          size: 30,

                          color: Color(0xFF8C59FF),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Upload Payment Screenshot",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Jpeg, Png, Pdf File ( maximum file size is 10MB )",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 14),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFDADADA),
                            //  PaymentUploadScreen.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 10,
                            ),
                          ),
                          child: const Text(
                            "Upload file",
                            style: TextStyle(
                              color: Color(0xFF8C59FF),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Center(
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(12),
              //     child: CustomPaint(
              //       // painter draws the dashed rounded rect
              //       painter: const DashedRRectPainter(
              //         color: purple,
              //         strokeWidth: 1.2,
              //         dashWidth: 6,
              //         dashGap: 4,
              //         radius: 12,
              //       ),
              //       child: Container(
              //         width: double.infinity,
              //         height: 160,
              //         color: Colors.white,
              //         alignment: Alignment.center,
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             const Icon(
              //               Icons.cloud_upload_outlined,
              //               size: 40,
              //               color: Colors.black54,
              //             ),
              //             const SizedBox(height: 8),
              //             const Text(
              //               "Upload Payment Screenshot",
              //               style: TextStyle(
              //                 fontSize: 14,
              //                 color: Colors.black87,
              //               ),
              //             ),
              //             const SizedBox(height: 8),
              //             const Text(
              //               "Jpeg, Png, Pdf File ( maximum file size is 10MB )",
              //               style: TextStyle(
              //                 fontSize: 12,
              //                 color: Colors.black54,
              //               ),
              //               textAlign: TextAlign.center,
              //             ),
              //             const SizedBox(height: 14),
              //             ElevatedButton(
              //               onPressed: () {},
              //               style: ElevatedButton.styleFrom(
              //                 backgroundColor: purple,
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(8),
              //                 ),
              //                 padding: const EdgeInsets.symmetric(
              //                   horizontal: 24,
              //                   vertical: 10,
              //                 ),
              //               ),
              //               child: const Text(
              //                 "Upload file",
              //                 style: TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 14,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 100),
              // Verify Button
              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF793FFF), // #793FFF
                        Color(0xFF492699), // #492699
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.transparent, // 👈 Transparent to show gradient
                      shadowColor: Colors.transparent, // 👈 Remove shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      "Verify",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: purple,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //       padding: const EdgeInsets.symmetric(vertical: 14),
              //     ),
              //     child: const Text(
              //       "Verify",
              //       style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w600,
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Custom painter that draws a dashed rounded rectangle around the child.
/// Uses PathMetrics.extractPath to render dashes along the rounded rect path.
class DashedRRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashGap;
  final double radius;

  const DashedRRectPainter({
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.dashWidth = 6.0,
    this.dashGap = 4.0,
    this.radius = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // inset the rect so stroke doesn't get clipped
    final double half = strokeWidth / 2;
    final Rect rect = Rect.fromLTWH(
      half,
      half,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );
    final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    final Path path = Path()..addRRect(rrect);

    final PathMetrics metrics = path.computeMetrics();
    for (final PathMetric metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double dashEnd = (distance + dashWidth).clamp(0.0, metric.length);
        final Path extract = metric.extractPath(distance, dashEnd);
        canvas.drawPath(extract, paint);
        distance = dashEnd + dashGap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashedRRectPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashGap != dashGap ||
        oldDelegate.radius != radius;
  }
}
