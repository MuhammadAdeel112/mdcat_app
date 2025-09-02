import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color textColor;
  final Color iconColor;
  final VoidCallback? onTap;

  const MenuItem({
    super.key,
    required this.text,
    required this.icon,
    this.textColor = const Color(0xFF333333),
    this.iconColor = const Color(0xFF333333),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
      trailing: const Icon(
        Icons.chevron_right,
        size: 22,
        color: Color(0xFF8C59FF),
      ),
      onTap: onTap,
    );
  }
}
