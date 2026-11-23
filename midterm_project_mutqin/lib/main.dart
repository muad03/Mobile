import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'pages/splash_page.dart';

void main() async {
  // Needed before we load the translation files.
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    // EasyLocalization wraps the whole app so every page can be translated.
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

// The main green color of Mutqin.
const Color mutqinGreen = Color(0xFF0B4F2E);

// Stateful because it remembers the theme (light or dark).
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  // Called from the Settings page switch.
  void changeTheme(bool isDark) {
    setState(() {
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Language: easy_localization gives us these three.
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      // Theme: one light, one dark, both from the same color.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mutqinGreen),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: mutqinGreen,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: themeMode,

      // We pass changeTheme down page by page until it reaches Settings.
      home: SplashPage(onThemeChanged: changeTheme),
    );
  }
}
