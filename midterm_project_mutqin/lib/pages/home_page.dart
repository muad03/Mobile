import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../models/student.dart';
import '../widgets/student_card.dart';
import 'details_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onThemeChanged});

  final ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('home.title')),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(onThemeChanged: onThemeChanged),
                ),
              );
            },
          ),
        ],
      ),
      // A list with one card for each student.
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return StudentCard(
            student: student,
            onTap: () {
              // Bonus: open the details page and send it the student.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(student: student),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
