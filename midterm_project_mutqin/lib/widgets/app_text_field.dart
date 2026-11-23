import 'package:flutter/material.dart';

// Our own text field, used on the Login and Sign up pages.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.icon,
    this.isPassword = false,
  });

  final String label;
  final IconData icon;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword, // hides the text with dots
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
