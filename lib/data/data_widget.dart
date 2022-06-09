import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../consts.dart';
import '../work_day.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({super.key, this.isScrollable = true});

  final bool isScrollable;

  String computeTotalMoney(List<WorkDay> data) {
    final format = NumberFormat.simpleCurrency(locale: "nl_EU");
    var minutes = 0;
    for (final day in data) {
      minutes += day.totalTime;
    }
    return format.format(minutes / 60 * 7.5).replaceAll("00", "-");
  }

  String formatMinutes(int minutes) {
    if (minutes % 60 == 0) {
      return "${minutes ~/ 60} uur";
    }
    return "${minutes ~/ 60} uur en ${minutes % 60} minuten";
  }

  @override
  Widget build(BuildContext context) {
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

    return ListView(
      shrinkWrap: true,
      physics: (isScrollable) ? null : const NeverScrollableScrollPhysics(),
      children: [
        ListTile(
          leading: Icon(
            Icons.monetization_on_outlined,
            size: 40,
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(
            computeTotalMoney(data),
            style: const TextStyle(fontSize: 20),
          ),
        ),
        for (final day in data)
          ListTile(
            leading: CircleAvatar(backgroundColor: day.color),
            title: Text(day.title),
            subtitle: Text(formatMinutes(day.totalTime)),
            trailing: Text("${day.date.day} ${kMonths[day.date.month]}"),
          ),
      ],
    );
  }
}
