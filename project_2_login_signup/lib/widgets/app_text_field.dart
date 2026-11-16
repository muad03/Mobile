import 'package:flutter/material.dart';

/// Custom text field, built once and used on both the Login and Sign up pages.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.icon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  final String label;
  final IconData icon;
  final bool isPassword;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.teal.shade700),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal.shade700, width: 2),
        ),
      ),
    );
  }
}
