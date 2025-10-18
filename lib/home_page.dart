import 'package:flutter/material.dart';
import 'package:todo_app_csi/tasks.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        title: const Text('To Do App'),
        backgroundColor: Colors.amber,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Tasks(),
    );
  }
}
