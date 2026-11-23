import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key, required this.onThemeChanged});

  // The changeTheme function from MyApp (main.dart).
  final ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isArabic = context.locale.languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(title: Text(context.tr('settings.title'))),
      body: ListView(
        children: [
          // Language button
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(context.tr('settings.language')),
            trailing: OutlinedButton(
              onPressed: () {
                // easy_localization changes the language of the whole app.
                context.setLocale(isArabic ? const Locale('en') : const Locale('ar'));
              },
              child: Text(isArabic ? 'English' : 'العربية'),
            ),
          ),
          // Dark mode switch
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: Text(context.tr('settings.dark_mode')),
            value: isDark,
            onChanged: onThemeChanged, // calls setState in MyApp
          ),
        ],
      ),
    );
  }
}
