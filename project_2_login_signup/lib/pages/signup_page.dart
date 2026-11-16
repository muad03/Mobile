import 'package:flutter/material.dart';

import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade50,
        elevation: 0,
        // Back arrow: goes back to the Login page.
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.teal.shade700),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        // Scrolls when the keyboard is open, so nothing overflows.
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create account',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                'Sign up to get started',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 32),
              const AppTextField(
                label: 'Full name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              const AppTextField(
                label: 'Email',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const AppTextField(
                label: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              const AppTextField(
                label: 'Confirm password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 24),
              AppButton(text: 'Create account', onPressed: () {}),
              const SizedBox(height: 16),
              // Wrap instead of Row: moves to a new line on narrow screens.
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text('Have an account?'),
                    TextButton(
                      onPressed: () {
                        // Goes back to the Login page.
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          color: Colors.teal.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
