import 'dart:io';
import 'package:flutter/material.dart';
import 'student_model.dart';
import 'db_helper.dart';

class StudentDetailPage extends StatelessWidget {
  final Student student;

  const StudentDetailPage({super.key, required this.student});

  void _deleteStudent(BuildContext context) async {
    await DbHelper().deleteStudent(student.id!);
    Navigator.pop(context, true); // Refresh after delete
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Delete Student"),
                  content: const Text(
                    "Are you sure you want to delete this student?",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text("Delete"),
                    ),
                  ],
                ),
              );

              if (confirm == true) {
                _deleteStudent(context);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            student.imagePath.isNotEmpty
                ? Image.file(File(student.imagePath), height: 200)
                : const Icon(Icons.person, size: 150),
            const SizedBox(height: 20),
            Text("Name: ${student.name}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(
              "Course: ${student.course}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Age: ${student.age}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Phone: ${student.phone}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
