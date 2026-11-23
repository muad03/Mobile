import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import '../widgets/icon_circle.dart';
import 'home_page.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.onThemeChanged});

  final ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          // Scrolls when the keyboard opens, so nothing overflows.
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const IconCircle(icon: Icons.menu_book, size: 50),
                const SizedBox(height: 24),
                Text(
                  context.tr('login.title'),
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(context.tr('login.subtitle')),
                const SizedBox(height: 32),
                AppTextField(label: context.tr('login.code'), icon: Icons.badge_outlined),
                const SizedBox(height: 16),
                AppTextField(
                  label: context.tr('login.password'),
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 24),
                AppButton(
                  text: context.tr('login.button'),
                  onPressed: () {
                    // No real login, just go to Home.
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(onThemeChanged: onThemeChanged),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // push: Sign up opens on top, so Back returns here.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupPage(onThemeChanged: onThemeChanged),
                      ),
                    );
                  },
                  child: Text(context.tr('login.go_signup')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
