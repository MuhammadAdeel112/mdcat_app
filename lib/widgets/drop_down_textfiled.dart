import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Color borderColor;
  final Color iconColor;
  final Color hintColor;
  final List<String> items;

  const CustomDropdown({
    super.key,
    required this.hint,
    required this.icon,
    required this.items,
    this.borderColor = const Color(0xFF793FFF),
    this.iconColor = const Color(0xFF793FFF),
    this.hintColor = const Color(0xFF793FFF),
  });

  @override
  Widget build(BuildContext context) {
    final selectedValue = ValueNotifier<String?>(null);

    return ValueListenableBuilder<String?>(
      valueListenable: selectedValue,
      builder: (context, value, _) {
        return DropdownButtonFormField<String>(
          value: value,
          icon: Icon(Icons.arrow_drop_down, color: iconColor),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: iconColor),
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
          items: items.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (newValue) {
            selectedValue.value = newValue;
          },
        );
      },
    );
  }
}
