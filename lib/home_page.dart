// import 'package:flutter/material.dart';
// import 'package:todo_app_csi/tasks.dart';
// import 'package:todo_app_csi/new_task.dart';
// import 'package:todo_app_csi/task.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({
//     super.key,
//     required this.onAddTask,
//     required this.onRemoveTask,
//   });
//   final void Function(Task task) onAddTask;
//   final void Function(Task task) onRemoveTask;
//   @override
//   State<HomePage> createState() {
//     return _HomePageState();
//   }
// }

// class _HomePageState extends State<HomePage> {
//   void _openModalOverlay() {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       builder: (ctx) => NewTask(onAddTask: (task) {}),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shadowColor: Colors.black,
//         title: const Text('To Do App'),
//         backgroundColor: Colors.amber,
//         actions: [
//           IconButton(onPressed: _openModalOverlay, icon: const Icon(Icons.add)),
//         ],
//       ),
//       body: Column(
//       children: [
//         const Text('Something'),
//         Expanded(child: TaskList(tasks: _registeredTasks)),
//       ],
//     );,
//     );
//   }
// }
