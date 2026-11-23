import 'package:flutter/material.dart';

// What one student has.
class Student {
  const Student({
    required this.name,
    required this.note,
    required this.code,
    required this.age,
    required this.juz,
    required this.attendance,
    required this.score,
    required this.icon,
  });

  final String name; // a key from the translation files
  final String note; // a key from the translation files (teacher's note)
  final String code; // student code, like S101
  final int age;
  final int juz; // how many juz he memorized (out of 30)
  final int attendance; // attendance in %
  final int score; // last test score out of 100
  final IconData icon; // the student picture

  // The student passes if the score is 50 or more.
  bool get passed => score >= 50;
}

// The students shown on the Home page.
const List<Student> students = [
  Student(
    name: 'students.anas',
    note: 'students.anas_note',
    code: 'S101',
    age: 11,
    juz: 3,
    attendance: 92,
    score: 88,
    icon: Icons.workspace_premium,
  ),
  Student(
    name: 'students.bilal',
    note: 'students.bilal_note',
    code: 'S102',
    age: 9,
    juz: 2,
    attendance: 88,
    score: 45,
    icon: Icons.replay,
  ),
  Student(
    name: 'students.omar',
    note: 'students.omar_note',
    code: 'S103',
    age: 13,
    juz: 5,
    attendance: 95,
    score: 84,
    icon: Icons.menu_book,
  ),
  Student(
    name: 'students.ziad',
    note: 'students.ziad_note',
    code: 'S104',
    age: 10,
    juz: 2,
    attendance: 68,
    score: 72,
    icon: Icons.schedule,
  ),
  Student(
    name: 'students.malik',
    note: 'students.malik_note',
    code: 'S105',
    age: 12,
    juz: 4,
    attendance: 77,
    score: 64,
    icon: Icons.trending_up,
  ),
  Student(
    name: 'students.adam',
    note: 'students.adam_note',
    code: 'S106',
    age: 8,
    juz: 1,
    attendance: 77,
    score: 91,
    icon: Icons.auto_stories,
  ),
];
