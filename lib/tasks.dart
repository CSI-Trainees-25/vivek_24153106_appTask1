import 'package:flutter/material.dart';
import 'package:todo_app_csi/task_list.dart';
import 'package:todo_app_csi/task.dart';
import 'package:todo_app_csi/new_task.dart';

class Tasks extends StatefulWidget {
  Tasks({super.key});

  @override
  State<StatefulWidget> createState() {
    return TasksState();
  }
}

class TasksState extends State {
  final List<Task> _registeredTasks = [
    Task(
      title: 'Create this todo app for CSI task 4',
      category: Category.society,
      date: new DateTime.now(),
    ),
    Task(
      title: 'Complete reading that novel.',
      category: Category.fun,
      date: DateTime.now(),
    ),
  ];
  void _openModalOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewTask(onAddTask: onAddTask),
    );
  }

  void onAddTask(Task task) {
    setState(() {
      _registeredTasks.add(task);
    });
  }

  void onRemoveTask(Task task) {
    _registeredTasks.remove(task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        title: const Text('To Do App'),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(onPressed: _openModalOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text('Something'),
          Expanded(child: TaskList(tasks: _registeredTasks)),
        ],
      ),
    );
  }
}
