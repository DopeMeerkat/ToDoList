import 'dart:collection';

import 'package:flutter/material.dart';

class Task {
  String name;
  Color color;
  SplayTreeMap<String, bool> subTasks;
  DateTime dueDate;
  int priority;
  String notes;
  bool complete;
  //add estimated time

  Task(this.name);
}