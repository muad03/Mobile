import 'package:flutter/material.dart';

// An icon inside a colored circle.
// Used as the logo, the onboarding pictures and the student pictures.
class IconCircle extends StatelessWidget {
  const IconCircle({super.key, required this.icon, this.size = 60});

  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(size / 2),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: size, color: colors.primary),
    );
  }
}
