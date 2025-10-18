import 'package:flutter/material.dart';
import 'package:todo_app_csi/task_list.dart';
import 'package:todo_app_csi/task.dart';

class Tasks extends StatefulWidget {
  Tasks({super.key});

  @override
  State<StatefulWidget> createState() {
    return TasksState();
  }
}

class TasksState extends State {
  List<Task> _registeredTasks = [
    Task(
      id: 01,
      title: 'Create this todo app for CSI task 4',
      category: Category.society,
      date: new DateTime.now(),
    ),
    Task(
      id: 02,
      title: 'Read this novel called Loneliness of Sonia and Sunny',
      category: Category.fun,
      date: new DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Something'),
        Expanded(child: TaskList(tasks: _registeredTasks)),
      ],
    );
  }
}
