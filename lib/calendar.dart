// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class MultiSelectCalendar extends StatefulWidget {
//   const MultiSelectCalendar(this.dateTime, {super.key});
//   final List<DateTime> dateTime;

//   @override
//   State<MultiSelectCalendar> createState() => _MultiSelectCalendarState();
// }

// class _MultiSelectCalendarState extends State<MultiSelectCalendar> {
//   DateTime _focusedDay = DateTime.now();

//   bool _isSameDay(DateTime a, DateTime b) {
//     return a.year == b.year && a.month == b.month && a.day == b.day;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[900],
//       appBar: AppBar(
//         title: const Text("Multiple Date Selection"),
//         backgroundColor: Colors.grey[850],
//       ),
//       body: TableCalendar(
//         firstDay: DateTime.utc(2020, 1, 1),
//         lastDay: DateTime.utc(2030, 12, 31),
//         focusedDay: _focusedDay,
//         calendarStyle: CalendarStyle(
//           todayDecoration: BoxDecoration(
//             color: Colors.blueAccent,
//             shape: BoxShape.circle,
//           ),
//           selectedDecoration: BoxDecoration(
//             color: Colors.greenAccent,
//             shape: BoxShape.circle,
//           ),
//         ),
//         selectedDayPredicate: (day) {
//           return widget.dateTime.any((selectedDay) => _isSameDay(selectedDay, day));
//         },
//         onDaySelected: (selectedDay, focusedDay) {
//           setState(() {
//             if (widget.dateTime.any((d) => _isSameDay(d, selectedDay))) {
//               widget.removeWhere((d) => _isSameDay(d, selectedDay));
//             } else {
//               _selectedDays.add(selectedDay);
//             }
//             _focusedDay = focusedDay;
//           });
//         },
//       ),
//     );
//   }
// }
