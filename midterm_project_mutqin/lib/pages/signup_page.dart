import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import 'home_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key, required this.onThemeChanged});

  final ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), // gives us the Back arrow
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              context.tr('signup.title'),
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(context.tr('signup.subtitle')),
            const SizedBox(height: 32),
            AppTextField(label: context.tr('signup.name'), icon: Icons.person_outline),
            const SizedBox(height: 16),
            AppTextField(label: context.tr('signup.phone'), icon: Icons.phone_outlined),
            const SizedBox(height: 16),
            AppTextField(
              label: context.tr('signup.password'),
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            const SizedBox(height: 24),
            AppButton(
              text: context.tr('signup.button'),
              onPressed: () {
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
                Navigator.pop(context); // back to Login
              },
              child: Text(context.tr('signup.go_login')),
            ),
          ],
        ),
      ),
    );
  }
}
