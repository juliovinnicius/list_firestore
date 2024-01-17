import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list_firestore/modules/home/domain/entities/task.dart';
import 'package:list_firestore/modules/home/domain/exceptions/store_task_exceptions.dart';
import 'package:list_firestore/modules/home/external/adapters/task_adapter.dart';
import 'package:list_firestore/modules/home/infrastructure/datasources/i_task_datasource.dart';

class TaskDatasource implements ITaskDatasource {
  @override
  Future<Task> storeTask({required Task task}) async {
    final storedTask = await TaskAdapter.toMap(task);

    final db = FirebaseFirestore.instance;

    final doc = await db.collection("list").add(storedTask);

    if (doc.id.isNotEmpty) {
      return task;
    } else {
      throw FirestoreException();
    }
  }
}
