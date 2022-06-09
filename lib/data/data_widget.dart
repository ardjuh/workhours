import 'package:flutter/material.dart';
import 'package:workhours/data/data.dart';

import 'consts.dart';

class DataWidget extends StatelessWidget {
  DataWidget({super.key, this.isScrollable = true});

  final bool isScrollable;

  String formatMinutes(int minutes) {
    if (minutes % 60 == 0) {
      return "${minutes ~/ 60} uur";
    }
    return "${minutes ~/ 60} uur en ${minutes % 60} minuten";
  }

  final data = Data();

  @override
  Widget build(BuildContext context) {
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
            data.totalMoney,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        for (final day in data.data)
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
