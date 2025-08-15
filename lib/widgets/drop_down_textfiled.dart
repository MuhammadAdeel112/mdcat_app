import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
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
    this.borderColor = const Color(0xFF793FFF), // default purple
    this.iconColor = const Color(0xFF793FFF), // default purple
    this.hintColor = const Color(0xFF793FFF), // default purple
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedValue,
      icon: Icon(Icons.arrow_drop_down, color: widget.iconColor),
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: widget.iconColor),
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
      items: widget.items.map((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedValue = value;
        });
      },
    );
  }
}
