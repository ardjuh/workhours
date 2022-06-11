import 'package:flutter/material.dart';

class WorkDay {
  WorkDay({
    required this.title,
    required this.color,
    required this.start,
    required this.end,
    DateTime? date,
    this.brake = const TimeOfDay(hour: 0, minute: 0),
  }) {
    if (date != null) {
      this.date = date;
    }
  }

  TimeOfDay start;
  TimeOfDay brake;
  TimeOfDay end;
  DateTime date = DateTime.now();
  Color color;
  String title;

  /// get the total time in minutes
  int get totalTime {
    final totalHours = end.hour - start.hour - brake.hour;
    final totalMinutes = end.minute - start.minute - brake.minute;
    return totalMinutes + totalHours * 60;
  }
}
