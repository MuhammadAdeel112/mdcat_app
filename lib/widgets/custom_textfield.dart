// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final String hint;
//   final IconData icon;
//   final bool obscure;

//   const CustomTextField({
//     super.key,
//     required this.hint,
//     required this.icon,
//     this.obscure = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       obscureText: obscure,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: Colors.purple),
//         hintText: hint,
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 15,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: const BorderSide(color: Colors.purple),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: const BorderSide(color: Colors.purple),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final String hint;
//   final IconData icon;
//   final bool obscure;

//   const CustomTextField({
//     super.key,
//     required this.hint,
//     required this.icon,
//     this.obscure = false,
//   });

//   // Purple color for border, icon, and typed text
//   static const Color purpleColor = Color(0xFF793FFF);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       obscureText: obscure,
//       cursorColor: purpleColor, // cursor color
//       style: const TextStyle(color: purpleColor), // typed text color
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: purpleColor), // icon color
//         hintText: hint,
//         // keep hint color default or unchanged
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 15,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: const BorderSide(color: purpleColor),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: const BorderSide(color: purpleColor),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: const BorderSide(color: purpleColor, width: 2),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final String hint;
//   final IconData icon;
//   final bool obscure;

//   const CustomTextField({
//     super.key,
//     required this.hint,
//     required this.icon,
//     this.obscure = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       obscureText: obscure,
//       style: const TextStyle(
//         color: Color(0xFF793FFF), // text color
//       ),
//       decoration: InputDecoration(
//         prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF793FFF)),
//         hintText: hint,
//         hintStyle: const TextStyle(
//           color: Color(0xFF793FFF), // hint text color
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 15,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: const BorderSide(color: Color(0xFF793FFF)),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: const BorderSide(color: Color(0xFF793FFF)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: const BorderSide(color: Color(0xFF793FFF), width: 2),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final String hint;
//   final IconData icon;
//   final bool obscure;
//   final Color borderColor;
//   final Color iconColor;
//   final Color hintColor;

//   const CustomTextField({
//     super.key,
//     required this.hint,
//     required this.icon,
//     this.obscure = false,
//     required this.borderColor,
//     required this.iconColor,
//     required this.hintColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       obscureText: obscure,
//       style: const TextStyle(
//         color: Color(0xFF793FFF), // Always full purple for typed text
//       ),
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: iconColor),
//         hintText: hint,
//         hintStyle: TextStyle(color: hintColor),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 15,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide(color: borderColor, width: 2),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide(color: borderColor, width: 2),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: const BorderSide(
//             color: Color(0xFF793FFF), // Full purple on focus
//             width: 2,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final IconData icon;
  final bool obscure;
  final Color borderColor;
  final Color iconColor;
  final Color hintColor;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.borderColor = const Color(0xFF793FFF), // default purple
    this.iconColor = const Color(0xFF793FFF), // default purple
    this.hintColor = const Color(0xFF793FFF), // default purple
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isObscured,
      style: TextStyle(color: widget.iconColor), // text color
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: widget.iconColor),
        suffixIcon: widget.obscure
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  color: widget.iconColor,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : null,
        hintText: widget.hint,
        hintStyle: TextStyle(color: widget.hintColor),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: widget.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: widget.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: widget.borderColor, width: 2),
        ),
      ),
    );
  }
}
