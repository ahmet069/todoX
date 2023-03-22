// To parse this JSON data, do
//
//     final Task = TaskFromJson(jsonString);

import 'dart:convert';

Task TaskFromJson(String str) => Task.fromJson(json.decode(str));

String TaskToJson(Task data) => json.encode(data.toJson());

class Task {
  Task({
    required this.id,
    required this.task,
    required this.date,
    required this.importance_level,
    required this.bg_color,
  });

  final int id;
  final String task;
  final String importance_level;
  final String date;
  final String bg_color;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        task: json["task"],
        date: json['date'],
        importance_level: json["importance_level"],
        bg_color: json["bg_color"],
      );

  Map<String, dynamic> toJson() => {
        "task": task,
        "date": date,
        "importance_level": importance_level,
        "bg_color": bg_color,
      };
}
