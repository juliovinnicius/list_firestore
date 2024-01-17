import 'dart:convert';

import 'package:list_firestore/modules/home/domain/entities/task.dart';

class TaskAdapter {
  static Future<Map<String, dynamic>> toMap(Task entity) async {
    return {
      'title': entity.title,
      'description': entity.description,
      'created': entity.created,
      'updated': entity.updated,
    };
  }

  static Future<Task> fromMap(Map<String, dynamic> map) async {
    return Task(
      title: map['title'],
      description: map['description'],
      created: map['created'],
      updated: map['updated'],
    );
  }

  static String toJson(Task entity) => json.encode(toMap(entity));

  static Future<Task> fromJSON(String source) async =>
      fromMap(jsonDecode(source));
}
