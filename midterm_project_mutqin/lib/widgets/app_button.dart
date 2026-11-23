import 'package:flutter/material.dart';

// Our own full-width button, used on Login, Sign up and Details.
class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed; // the function to run on tap

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
