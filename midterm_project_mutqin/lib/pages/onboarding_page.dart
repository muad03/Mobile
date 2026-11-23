import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../widgets/icon_circle.dart';
import 'login_page.dart';

// 3 intro pages using the introduction_screen package.
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.onThemeChanged});

  final ValueChanged<bool> onThemeChanged;

  void goToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(onThemeChanged: onThemeChanged),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return IntroductionScreen(
      globalBackgroundColor: Theme.of(context).colorScheme.surface,
      pages: [
        PageViewModel(
          title: context.tr('onboarding.title1'),
          body: context.tr('onboarding.body1'),
          image: const IconCircle(icon: Icons.menu_book, size: 80),
        ),
        PageViewModel(
          title: context.tr('onboarding.title2'),
          body: context.tr('onboarding.body2'),
          image: const IconCircle(icon: Icons.notifications_active_outlined, size: 80),
        ),
        PageViewModel(
          title: context.tr('onboarding.title3'),
          body: context.tr('onboarding.body3'),
          image: const IconCircle(icon: Icons.bar_chart, size: 80),
        ),
      ],
      showSkipButton: true,
      skip: Text(context.tr('onboarding.skip'), style: TextStyle(color: primary)),
      next: Text(context.tr('onboarding.next'), style: TextStyle(color: primary)),
      done: Text(context.tr('onboarding.done'), style: TextStyle(color: primary)),
      onSkip: () => goToLogin(context),
      onDone: () => goToLogin(context),
      dotsDecorator: DotsDecorator(activeColor: primary),
    );
  }
}
