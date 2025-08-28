import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscure;
  final Color borderColor;
  final Color iconColor;
  final Color hintColor;
  final TextEditingController? textEditingController;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.borderColor = const Color(0xFF793FFF),
    this.iconColor = const Color(0xFF793FFF),
    this.hintColor = const Color(0xFF793FFF),
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    final isObscured = ValueNotifier<bool>(obscure);

    return ValueListenableBuilder<bool>(
      valueListenable: isObscured,
      builder: (context, value, _) {
        return TextField(
          controller: textEditingController,
          obscureText: value,
          style: TextStyle(color: iconColor),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: iconColor),
            suffixIcon: obscure
                ? IconButton(
                    icon: Icon(
                      value ? Icons.visibility_off : Icons.visibility,
                      color: iconColor,
                    ),
                    onPressed: () {
                      isObscured.value = !value;
                    },
                  )
                : null,
            hintText: hint,
            hintStyle: TextStyle(color: hintColor),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: borderColor, width: 2),
            ),
          ),
        );
      },
    );
  }
}
