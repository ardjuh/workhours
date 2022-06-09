import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../work_day.dart';

class Data {
  Data();

  final data = [
    WorkDay(
      color: Colors.blue,
      title: "Ochtend",
      date: DateTime(2022, 5, 9),
      start: const TimeOfDay(hour: 8, minute: 0),
      end: const TimeOfDay(hour: 12, minute: 15),
    ),
    WorkDay(
      color: Colors.red,
      title: "Hele dag",
      date: DateTime.now(),
      start: const TimeOfDay(hour: 8, minute: 0),
      brake: const TimeOfDay(hour: 1, minute: 30),
      end: const TimeOfDay(hour: 20, minute: 30),
    ),
  ];

  String get totalMoney {
    final format = NumberFormat.simpleCurrency(locale: "nl_EU");
    var minutes = 0;
    for (final day in data) {
      minutes += day.totalTime;
    }
    return format.format(minutes / 60 * 7.5).replaceAll("00", "-");
  }
}
