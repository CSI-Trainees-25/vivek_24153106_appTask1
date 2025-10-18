//import 'package:flutter/material.dart';

enum Category {work, studies, society, fun, reading, others}

class Task {
  Task({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
  });
  final int id;
  final String title;
  final Category category;
  final DateTime date;
}
