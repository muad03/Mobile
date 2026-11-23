import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../models/student.dart';
import '../widgets/icon_circle.dart';
import '../widgets/info_row.dart';

// Bonus page: everything about one student.
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.student});

  final Student student; // received from the Home page

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(context.tr(student.name))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            IconCircle(icon: student.icon, size: 60),
            const SizedBox(height: 16),
            Text(
              context.tr(student.name),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            InfoRow(label: context.tr('student.code'), value: student.code),
            InfoRow(label: context.tr('student.age'), value: '${student.age}'),
            InfoRow(label: context.tr('student.juz'), value: '${student.juz}/30'),
            InfoRow(label: context.tr('student.attendance'), value: '${student.attendance}%'),
            InfoRow(label: context.tr('student.score'), value: '${student.score}/100'),
            const SizedBox(height: 8),
            // Pass or fail, in green or red.
            Text(
              student.passed ? context.tr('student.pass') : context.tr('student.fail'),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: student.passed ? colors.primary : colors.error,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              context.tr('student.note'),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              context.tr(student.note),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
