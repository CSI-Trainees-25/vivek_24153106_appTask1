import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_csi/task.dart';
//import 'package:todo_app_csi/tasks.dart';

final formatter = DateFormat.yMd();

class NewTask extends StatefulWidget {
  const NewTask({super.key, required this.onAddTask});
  final void Function(Task task) onAddTask;

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
                TextButton(
                  onPressed: () {
                    if (_titleController.text.trim().isEmpty ||
                        _selectedDate == null) {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('Invalid Input'),
                          content: Text(
                            'Please make sure all the entries are valid.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(ctx);
                              },
                              child: const Text('Ok.'),
                            ),
                          ],
                        ),
                      );
                      return;
                    }
                    Task task = Task(
                      title: _titleController.text,
                      category: _selectedCategory,
                      date: _selectedDate!,
                    );
                    widget.onAddTask(task);
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
