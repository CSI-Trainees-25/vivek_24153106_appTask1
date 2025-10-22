import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app_csi/task.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen(this._registeredTasks, {super.key});
  final List<Task> _registeredTasks;

  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        focusedDay: DateTime.now(),
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 1, 1),
        selectedDayPredicate: (day) {
          return widget._registeredTasks.any(
            (task) => isSameDay(task.date, day),
          );
        },
      ),
    );
  }
}
