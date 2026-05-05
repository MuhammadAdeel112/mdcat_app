// // import 'dart:io';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:mdcat/providers/payment_provider.dart';
// import 'package:provider/provider.dart';
// // import 'payment_provider.dart';

// class PaymentUploadScreen extends StatelessWidget {
//   const PaymentUploadScreen({super.key});

//   static const Color purple = Color(0xFF7B3EFF);

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<PaymentProvider>(context);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Back button
//                 Row(
//                   children: [
//                     Container(
//                       width: 36,
//                       height: 36,
//                       decoration: BoxDecoration(
//                         color: Color(0x0F8C59FF),
//                         shape: BoxShape.circle,
//                       ),
//                       child: IconButton(
//                         icon: const Icon(
//                           Icons.arrow_back_ios_new,
//                           size: 16,
//                           color: Colors.black87,
//                         ),
//                         onPressed: () => Navigator.maybePop(context),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),

//                 // Title: "Instructions for Payements" (with purple word)
//                 RichText(
//                   text: TextSpan(
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: "lexend",
//                     ),
//                     children: [
//                       TextSpan(
//                         text: "Instructions ",
//                         style: TextStyle(
//                           color: Color(0xFF8C59FF),
//                           fontFamily: "lexend",
//                         ),
//                       ),
//                       TextSpan(text: "for Payements"),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 Center(
//                   child: const Text(
//                     "Lorem ipsum dolor sit amet consectetur. Quam varius tortor aliquam habitant. "
//                     "Lorem ipsum dolor sit amet consectetur. Quam varius tortor aliquam habitant. "
//                     "See Example",
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Color(0xCC333333),
//                       height: 1.4,
//                       fontFamily: 'lexend',
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 40),

//                 // Upload File row
//                 Row(
//                   children: const [
//                     Icon(
//                       Icons.upload_file_outlined,
//                       color: Colors.black87,
//                       size: 22,
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         "Upload file",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 6),
//                 const Text(
//                   "Move your files to the frame below or select from Device",
//                   style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
//                 ),
//                 const SizedBox(height: 40),

//                 // ---- Custom dashed upload box ----
//                 Center(
//                   child: CustomPaint(
//                     size: const Size(double.infinity, 160),
//                     painter: const DashedRRectPainter(
//                       color: PaymentUploadScreen.purple,
//                       strokeWidth: 1.2,
//                       dashWidth: 6,
//                       dashGap: 4,
//                       radius: 12,
//                     ),
//                     child: Container(
//                       width: double.infinity,
//                       height: 160,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(
//                             Icons.cloud_upload_outlined,
//                             size: 30,
//                             color: Color(0xFF8C59FF),
//                           ),
//                           const SizedBox(height: 8),
//                           const Text(
//                             "Upload Payment Screenshot",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           const Text(
//                             "Jpeg, Png, Pdf File ( maximum file size is 10MB )",
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.black54,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           const SizedBox(height: 14),
//                           ElevatedButton(
//                             onPressed: () async {
//                               await provider.pickFile();
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xFFEEEAF8),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 side: const BorderSide(
//                                   color: Color(0xFFCCCCCC),
//                                   width: 1,
//                                 ),
//                               ),
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 24,
//                                 vertical: 10,
//                               ),
//                             ),
//                             child: Text(
//                               provider.selectedFileName ?? "Upload file",
//                               style: const TextStyle(
//                                 color: Color(0xFF8C59FF),
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),

//                           //
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 // ---- New Row with Transaction ID & Amount TextFields ----
//                 Container(
//                   width: 324,
//                   height: 86.5,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Transaction ID
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Enter Transaction id",
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           const SizedBox(height: 15),
//                           Container(
//                             width: 156,
//                             height: 45,
//                             child: TextField(
//                               controller: provider.transactionIdController,
//                               decoration: InputDecoration(
//                                 hintText: "ID : 12241414142134313",
//                                 filled: true,
//                                 fillColor: Color(0xFFEEEAF8),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(8),
//                                   ),
//                                   borderSide: BorderSide(
//                                     color: Color(0xFFCCCCCC),
//                                     width: 1,
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(8),
//                                   ),
//                                   borderSide: BorderSide(
//                                     color: Color(0xFF8C59FF),
//                                     width: 2,
//                                   ),
//                                 ),
//                                 contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 12,
//                                   vertical: 10,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(width: 12),
//                       // Amount
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Enter Amount",
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           const SizedBox(height: 15),
//                           Container(
//                             width: 156,
//                             height: 45,
//                             child: TextField(
//                               controller: provider.amountController,
//                               keyboardType: TextInputType.number,
//                               decoration: InputDecoration(
//                                 hintText: "PKR : 1200",
//                                 filled: true,
//                                 fillColor: Color(0xFFEEEAF8),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(8),
//                                   ),
//                                   borderSide: BorderSide(
//                                     color: Color(0xFFCCCCCC),
//                                     width: 1,
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(8),
//                                   ),
//                                   borderSide: BorderSide(
//                                     color: Color(0xFF8C59FF),
//                                     width: 2,
//                                   ),
//                                 ),
//                                 contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 12,
//                                   vertical: 10,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 40),

//                 // Verify Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [Color(0xFF793FFF), Color(0xFF492699)],
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: ElevatedButton(
//                       onPressed: provider.isLoading
//                           ? null
//                           : () => provider.submitPayment(context),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.transparent,
//                         shadowColor: Colors.transparent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                       ),
//                       child: provider.isLoading
//                           ? const CircularProgressIndicator(color: Colors.white)
//                           : const Text(
//                               "Verify",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.white,
//                               ),
//                             ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// Custom painter for dashed rounded rectangle
// class DashedRRectPainter extends CustomPainter {
//   final Color color;
//   final double strokeWidth;
//   final double dashWidth;
//   final double dashGap;
//   final double radius;

//   const DashedRRectPainter({
//     this.color = Colors.black,
//     this.strokeWidth = 1.0,
//     this.dashWidth = 6.0,
//     this.dashGap = 4.0,
//     this.radius = 0.0,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.round;

//     final double half = strokeWidth / 2;
//     final Rect rect = Rect.fromLTWH(
//       half,
//       half,
//       size.width - strokeWidth,
//       size.height - strokeWidth,
//     );
//     final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
//     final Path path = Path()..addRRect(rrect);

//     final PathMetrics metrics = path.computeMetrics();
//     for (final PathMetric metric in metrics) {
//       double distance = 0.0;
//       while (distance < metric.length) {
//         final double dashEnd = (distance + dashWidth).clamp(0.0, metric.length);
//         final Path extract = metric.extractPath(distance, dashEnd);
//         canvas.drawPath(extract, paint);
//         distance = dashEnd + dashGap;
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(covariant DashedRRectPainter oldDelegate) {
//     return oldDelegate.color != color ||
//         oldDelegate.strokeWidth != strokeWidth ||
//         oldDelegate.dashWidth != dashWidth ||
//         oldDelegate.dashGap != dashGap ||
//         oldDelegate.radius != radius;
//   }
// }
// import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mdcat/providers/payment_provider.dart';
import 'package:provider/provider.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:dio/dio.dart';
// import 'package:mdcat/services/token_storage.dart';

class PaymentUploadScreen extends StatelessWidget {
  const PaymentUploadScreen({super.key});

  static const Color purple = Color(0xFF7B3EFF);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PaymentProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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

                // Title
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
                      ),
                      TextSpan(text: "for Payments"),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Center(
                  child: Text(
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

                // Custom dashed upload box
                Center(
                  child: CustomPaint(
                    size: const Size(double.infinity, 160),
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
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Jpeg, Png, Pdf File ( maximum file size is 10MB )",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 14),
                          ElevatedButton(
                            onPressed: () async {
                              await provider.pickFile();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEEEAF8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                  color: Color(0xFFCCCCCC),
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 10,
                              ),
                            ),
                            child: Text(
                              provider.selectedFileName ?? "Upload file",
                              style: const TextStyle(
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
                const SizedBox(height: 40),

                // Amount TextField
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Enter Amount",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: 324,
                      height: 45,
                      child: TextField(
                        controller: provider.amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "PKR : 1200",
                          filled: true,
                          fillColor: Color(0xFFEEEAF8),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: Color(0xFFCCCCCC),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: Color(0xFF8C59FF),
                              width: 2,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Verify Button
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF793FFF), Color(0xFF492699)],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: provider.isLoading
                          ? null
                          : () => provider.submitPayment(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: provider.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom painter for dashed rounded rectangle
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
