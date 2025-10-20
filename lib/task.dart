import 'package:flutter/material.dart';
import 'package:todo_app_csi/new_task.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { work, studies, society, fun, reading, others }

const taskCategory = {
  Category.fun: Icons.sports_football,
  Category.reading: Icons.book,
  Category.society: Icons.people,
  Category.studies: Icons.school,
  Category.work: Icons.computer,
  Category.others: Icons.flag,
};

class Task {
  Task({required this.title, required this.category, required this.date})
    : id = uuid.v4();
  final String id;
  final String title;
  final Category category;
  final DateTime date;
  bool? isDone = false;

  String get FormattedDate {
    return formatter.format(date);
  }
}
