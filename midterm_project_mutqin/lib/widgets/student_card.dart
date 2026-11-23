import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../models/student.dart';
import 'icon_circle.dart';

// One student row in the Home list.
class StudentCard extends StatelessWidget {
  const StudentCard({super.key, required this.student, required this.onTap});

  final Student student;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      child: ListTile(
        onTap: onTap, // makes the card tappable
        leading: IconCircle(icon: student.icon, size: 20),
        title: Text(
          context.tr(student.name),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${context.tr('student.juz')}: ${student.juz}'),
        trailing: Text(
          '${student.score}/100',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            // green if he passed, red if he failed
            color: student.passed ? colors.primary : colors.error,
          ),
        ),
      ),
    );
  }
}
