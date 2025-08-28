// import 'package:flutter/material.dart';

// class CategoryCard extends StatelessWidget {
//   final String image; // or emoji if you kept that earlier
//   final String title;
//   final String subtitle;
//   final Color color; // you can ignore this now if you always want white

//   const CategoryCard({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.subtitle,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xFFFFFFFF), // inside color = white (#FFFFFF)
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(
//           color: const Color(0xFFCCCCCC), // border color #CCCCCC
//           width: 1.5,
//         ),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x14000000), // black with 8% opacity (#00000014)
//             blurRadius: 25, // blur: 25px
//             offset: Offset(8, 4), // 8px right, 4px down
//             spreadRadius: 0,
//             blurStyle: BlurStyle.inner, // 👈 makes it "inset"
//           ),
//         ],
//       ),
//       // padding: const EdgeInsets.all(16),
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Image.asset(
//                 image,
//                 // width: 50,
//                 width: 50,
//                 height: 50,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: Text(
//               title,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//           ),
//           const SizedBox(height: 4),
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: Text(
//               subtitle,
//               style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback? onTap; // 👈 add this

  const CategoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.color,
    this.onTap, // 👈 allow optional callback
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 👈 use the callback here
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFCCCCCC), width: 1.5),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 25,
              offset: Offset(8, 4),
              spreadRadius: 0,
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                subtitle,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
