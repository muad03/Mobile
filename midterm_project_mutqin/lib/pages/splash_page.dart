import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../widgets/icon_circle.dart';
import 'onboarding_page.dart';

// Shows the logo and app name for 3 seconds, then opens onboarding.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.onThemeChanged});

  final ValueChanged<bool> onThemeChanged;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Wait 3 seconds, then go to onboarding.
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // pushReplacement: the user can't press Back to return to the splash.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                OnboardingPage(onThemeChanged: widget.onThemeChanged),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const IconCircle(icon: Icons.menu_book, size: 60),
            const SizedBox(height: 24),
            Text(
              context.tr('app_name'),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: colors.onPrimary,
              ),
            ),
          ],
        ).animate().fadeIn(duration: 800.ms), // flutter_animate: fade in
      ),
    );
  }
}
