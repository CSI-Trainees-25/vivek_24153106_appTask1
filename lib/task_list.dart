import 'package:flutter/material.dart';
import 'package:todo_app_csi/task.dart';
import 'package:todo_app_csi/task_card.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.tasks, required this.onRemove});
  final void Function(Task task) onRemove;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direction) {
          onRemove(tasks[index]);
        },
        key: ValueKey(tasks[index]),
        child: TaskCard(tasks[index]),
      ),
    );
  }
}
