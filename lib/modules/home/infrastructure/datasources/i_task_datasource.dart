import 'package:list_firestore/modules/home/domain/entities/task.dart';

abstract class ITaskDatasource {
  Future<Task> storeTask({required Task task});

  Future<List<Task>> getTasks();

  Future<Task> deleteTask({required Task task});

  Future<Task> editTask({required Task task});
}
