import 'package:flutter/material.dart';
import 'package:todo_app_csi/formatted_text.dart';
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(2, 2),
            ),
          ],
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 49, 49, 49),
              const Color.fromARGB(255, 66, 66, 66),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              FormattedText(widget.task.title),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      Icon(taskCategory[widget.task.category]),
                      Checkbox(
                        value: widget.task.isDone,
                        onChanged: (newValue) {
                          setState(() {
                            widget.task.isDone = newValue;
                          });
                        },
                      ),

                      SizedBox(width: 200),
                      FormattedText(widget.task.FormattedDate),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
