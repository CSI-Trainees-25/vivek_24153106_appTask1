import 'package:flutter/material.dart';
import 'package:todo_app_csi/task.dart';

class TaskCard extends StatefulWidget {
  const TaskCard(this.task, {super.key});
  final Task task;

  @override
  State<StatefulWidget> createState() {
    return _TaskCardState();
  }
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(widget.task.title),
            const SizedBox(height: 5),
            Row(
              children: [
                const Spacer(),
                Row(
                  children: [
                    Checkbox(
                      value: widget.task.isDone,
                      onChanged: (newValue) {
                        setState(() {
                          widget.task.isDone = newValue;
                        });
                      },
                    ),
                    Icon(taskCategory[widget.task.category]),
                    SizedBox(width: 50),
                    Text(widget.task.FormattedDate),
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
