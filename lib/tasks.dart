import 'package:flutter/material.dart';
import 'package:todo_app_csi/task_list.dart';
import 'package:todo_app_csi/task.dart';
import 'package:todo_app_csi/new_task.dart';
import 'package:table_calendar/table_calendar.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<StatefulWidget> createState() {
    return TasksState();
  }
}

class TasksState extends State<Tasks> {
  final List<Task> _registeredTasks = [
    Task(
      title: 'Create this todo app for CSI task 4',
      category: Category.society,
      date: DateTime.now(),
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

  int getIndex() {
    int index = 0;
    if (index >= _registeredTasks.length) index = 0;
    return index++;
  }

  void onAddTask(Task task) {
    setState(() {
      _registeredTasks.add(task);
    });
  }

  void onRemoveTask(Task task) {
    var index = _registeredTasks.indexOf(task);
    setState(() {
      _registeredTasks.remove(task);
    });
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: const Text('task deleted'),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
              _registeredTasks.insert(index, task);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 38, 38),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 81, 81),
        title: const Text(
          'To Do App',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(onPressed: _openModalOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text(
            'calendar view',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                children: [
                  Text('view calendar view of the tasks'),
                  Container(
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
                    child: TableCalendar(
                      focusedDay: _registeredTasks[getIndex()].date,
                      firstDay: DateTime(
                        _registeredTasks[getIndex()].date.year - 1,
                      ),
                      lastDay: DateTime(
                        _registeredTasks[getIndex()].date.year + 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'tasks',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Expanded(
            child: TaskList(tasks: _registeredTasks, onRemove: onRemoveTask),
          ),
        ],
      ),
    );
  }
}
