// import 'package:flutter/material.dart';

// class CustomDropdown extends StatelessWidget {
//   final String hint;
//   final IconData icon;
//   final Color borderColor;
//   final Color iconColor;
//   final Color hintColor;
//   final List<String> items;

//   const CustomDropdown({
//     super.key,
//     required this.hint,
//     required this.icon,
//     required this.items,
//     this.borderColor = const Color(0xFF793FFF),
//     this.iconColor = const Color(0xFF793FFF),
//     this.hintColor = const Color(0xFF793FFF),
//   });

//   @override
//   Widget build(BuildContext context) {
//     final selectedValue = ValueNotifier<String?>(null);

//     return ValueListenableBuilder<String?>(
//       valueListenable: selectedValue,
//       builder: (context, value, _) {
//         return DropdownButtonFormField<String>(
//           value: value,
//           icon: Icon(Icons.arrow_drop_down, color: iconColor),
//           decoration: InputDecoration(
//             prefixIcon: Icon(icon, color: iconColor),
//             hintText: hint,
//             hintStyle: TextStyle(color: hintColor),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 15,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: BorderSide(color: borderColor),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: BorderSide(color: borderColor),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: BorderSide(color: borderColor, width: 2),
//             ),
//           ),
//           items: items.map((String value) {
//             return DropdownMenuItem<String>(value: value, child: Text(value));
//           }).toList(),
//           onChanged: (newValue) {
//             selectedValue.value = newValue;
//           },
//         );
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class CustomDropdown extends StatefulWidget {
//   final String hint;
//   final IconData icon;
//   final Color borderColor;
//   final Color iconColor;
//   final Color hintColor;
//   final List<String> items;

//   const CustomDropdown({
//     super.key,
//     required this.hint,
//     required this.icon,
//     required this.items,
//     this.borderColor = const Color(0xFF793FFF),
//     this.iconColor = const Color(0xFF793FFF),
//     this.hintColor = const Color(0xFF793FFF),

//     // required void Function(dynamic value) onChanged,
//   });

//   @override
//   State<CustomDropdown> createState() => _CustomDropdownState();
// }

// class _CustomDropdownState extends State<CustomDropdown> {
//   String? selectedValue;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       value: selectedValue,
//       icon: Icon(Icons.arrow_drop_down, color: widget.iconColor),
//       decoration: InputDecoration(
//         prefixIcon: Icon(widget.icon, color: widget.iconColor),
//         hintText: widget.hint,
//         hintStyle: TextStyle(color: widget.hintColor),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 15,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide(color: widget.borderColor),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide(color: widget.borderColor),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide(color: widget.borderColor, width: 2),
//         ),
//       ),
//       items: widget.items.map((String value) {
//         return DropdownMenuItem<String>(value: value, child: Text(value));
//       }).toList(),
//       onChanged: (newValue) {
//         setState(() {
//           selectedValue = newValue;
//         });
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class CustomDropdown extends StatefulWidget {
//   final String hint;
//   final IconData icon;
//   final Color borderColor;
//   final Color iconColor;
//   final Color hintColor;
//   final List<String> items;
//   final ValueChanged<String?>? onChanged; // ✅ Add callback

//   const CustomDropdown({
//     super.key,
//     required this.hint,
//     required this.icon,
//     required this.items,
//     this.borderColor = const Color(0xFF793FFF),
//     this.iconColor = const Color(0xFF793FFF),
//     this.hintColor = const Color(0xFF793FFF),
//     this.onChanged, // ✅ Add this
//   });

//   @override
//   State<CustomDropdown> createState() => _CustomDropdownState();
// }

// class _CustomDropdownState extends State<CustomDropdown> {
//   String? selectedValue;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       value: selectedValue,
//       icon: Icon(Icons.arrow_drop_down, color: widget.iconColor),
//       decoration: InputDecoration(
//         prefixIcon: Icon(widget.icon, color: widget.iconColor),
//         hintText: widget.hint,
//         hintStyle: TextStyle(color: widget.hintColor),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 15,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide(color: widget.borderColor),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide(color: widget.borderColor),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide(color: widget.borderColor, width: 2),
//         ),
//       ),
//       items: widget.items.map((String value) {
//         return DropdownMenuItem<String>(value: value, child: Text(value));
//       }).toList(),
//       onChanged: (newValue) {
//         setState(() {
//           selectedValue = newValue;
//         });
//         if (widget.onChanged != null) {
//           widget.onChanged!(newValue); // ✅ Notify parent
//         }
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String hint;
  final String? value; // 👈 allow external default value
  final IconData icon;
  final Color borderColor;
  final Color iconColor;
  final Color hintColor;
  final List<String> items;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    super.key,
    required this.hint,
    required this.icon,
    required this.items,
    this.value, // 👈 new param
    this.borderColor = const Color(0xFF793FFF),
    this.iconColor = const Color(0xFF793FFF),
    this.hintColor = const Color(0xFF793FFF),
    this.onChanged,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value; // 👈 initialize from parent
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
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
      onChanged: (newValue) {
        setState(() {
          selectedValue = newValue;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      },
    );
  }
}
