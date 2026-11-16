import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:login_signup/main.dart';
import 'package:login_signup/widgets/app_button.dart';
import 'package:login_signup/widgets/app_text_field.dart';

void main() {
  WidgetController.hitTestWarningShouldBeFatal = true;

  testWidgets('Login page shows its fields and buttons', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.byType(AppTextField), findsNWidgets(2));
    expect(find.widgetWithText(AppButton, 'Login'), findsOneWidget);
    expect(find.text('Forgot password?'), findsOneWidget);
  });

  testWidgets('Sign up opens, back arrow and Log in go back', (tester) async {
    await tester.pumpWidget(const MyApp());

    // Sign up opens the Sign up page.
    await tester.tap(find.text('Sign up'));
    await tester.pumpAndSettle();
    expect(find.text('Create account'), findsNWidgets(2)); // title + button
    expect(find.byType(AppTextField), findsNWidgets(4));

    // The back arrow goes back.
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    expect(find.text('Welcome back'), findsOneWidget);

    // Log in also goes back.
    await tester.tap(find.text('Sign up'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Log in'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome back'), findsOneWidget);
  });

  testWidgets('No overflow on a small screen with the keyboard open', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1;
    tester.view.viewInsets = const FakeViewPadding(bottom: 300);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());
    expect(tester.takeException(), isNull);

    // The page scrolls, so Sign up can be reached above the keyboard.
    await tester.ensureVisible(find.text('Sign up'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sign up'));
    await tester.pumpAndSettle();
    expect(find.text('Sign up to get started'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
