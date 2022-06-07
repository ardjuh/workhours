import 'package:flutter/material.dart';
import 'work_day.dart';

const months = [
  "",
  "jan.",
  "feb.",
  "mrt.",
  "apr.",
  "mei",
  "juni",
  "juli",
  "aug.",
  "sep.",
  "okt.",
  "nov.",
  "dec.",
];

final selectionOptions = [
  WorkDay(
    title: "Hele dag",
    color: Colors.red,
    start: const TimeOfDay(hour: 8, minute: 0),
    brake: const TimeOfDay(hour: 1, minute: 30),
    end: const TimeOfDay(hour: 20, minute: 30),
  ),
  WorkDay(
    title: "Ochtend",
    color: Colors.blue,
    start: const TimeOfDay(hour: 8, minute: 0),
    end: const TimeOfDay(hour: 12, minute: 0),
  ),
  WorkDay(
    title: "Avond",
    color: Colors.green,
    start: const TimeOfDay(hour: 18, minute: 0),
    brake: const TimeOfDay(hour: 0, minute: 0),
    end: const TimeOfDay(hour: 20, minute: 30),
  ),
];

const addScreenHeroTag = "AddScreenHeroTag";
