import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_csi/task.dart';

final formatter = DateFormat.yMd();

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();

  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;

  void _openDatePicker() async {
    DateTime first = DateTime.now();
    DateTime lastDate = DateTime(first.year + 1);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: first,
      lastDate: lastDate,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _addTask() {
    Task task = Task(
      title: _titleController.text,
      category: _selectedCategory,
      date: _selectedDate!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(20, 60, 20, 20),
      child: Container(
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text('new task title')),
            ),
            Row(
              children: [
                DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (el) => DropdownMenuItem(
                          value: el,
                          child: Text(el.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
                Text(
                  _selectedDate == null
                      ? 'no date selected'
                      : formatter.format(_selectedDate!),
                ),
                IconButton(
                  onPressed: _openDatePicker,
                  icon: Icon(Icons.calendar_month),
                ),
                Spacer(),
                TextButton(onPressed: () {}, child: Text('Add')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
