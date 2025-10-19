//import 'package:flutter/material.dart';
import 'package:todo_app_csi/new_task.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {work, studies, society, fun, reading, others}

class Task {
  Task({
    required this.title,
    required this.category,
    required this.date,
  }): id = uuid.v4();
  final String id;
  final String title;
  final Category category;
  final DateTime date;

  String get FormattedDate {
    return formatter.format(date);
  }
}
