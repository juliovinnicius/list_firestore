import 'dart:convert';

import 'package:list_firestore/modules/home/domain/entities/task.dart';

class TaskAdapter {
  static Future<Map<String, dynamic>> toMap(Task entity) async {
    return {
      'id': entity.id,
      'title': entity.title,
      'description': entity.description,
      'created': entity.created,
      'updated': entity.updated,
    };
  }

  static Future<Task> fromMap(Map<String, dynamic> map) async {
    return Task(
      id: map['id'] ?? '',
      title: map['title'],
      description: map['description'],
      created:
          map['created'] != null ? map['created'].toDate() : DateTime.now(),
      updated:
          map['updated'] != null ? map['updated'].toDate() : DateTime.now(),
    );
  }

  static String toJson(Task entity) => json.encode(toMap(entity));

  static Future<Task> fromJSON(String source) async =>
      fromMap(jsonDecode(source));
}
