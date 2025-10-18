import 'package:flutter/material.dart';
import 'package:todo_app_csi/task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(this.task, {super.key});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(task.title),
            const SizedBox(height: 5),
            Row(
              children: [
                const Spacer(),
                Row(
                  children: [
                    Text(task.category.toString()),
                    SizedBox(width: 8),
                    Text(task.date.toString()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
