import 'package:flutter/material.dart';
//import 'package:todo_app_csi/formatted_text.dart';
//import 'package:todo_app_csi/task.dart';

class CategorySelect extends StatelessWidget {
  const CategorySelect({super.key});
  //final void Function(String text) renderList;
  final List<String> menuItems = const [
    'all',
    'completed',
    'uncompleted',
    'work',
    'studies',
    'society',
    'fun',
    'reading',
    'other',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsGeometry.all(2),
            child: TextButton(
              onPressed: () {
                //renderList(menuItems[index]);
              },
              child: Text(
                menuItems[index].toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          );
        },
      ),
    );
  }
}
