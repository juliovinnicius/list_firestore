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

    await db.collection("list").doc(task.id).set(storedTask);

    return task;
  }

  @override
  Future<List<Task>> getTasks() async {
    final db = FirebaseFirestore.instance;

    final querySnapshot = await db.collection("list").get();

    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    if (allData.isNotEmpty) {
      final listTask = <Task>[];

      for (final element in allData) {
        listTask.add(await TaskAdapter.fromMap(element));
      }
      return listTask;
    } else {
      throw FirestoreException();
    }
  }

  @override
  Future<Task> deleteTask({required Task task}) async {
    final db = FirebaseFirestore.instance;

    await db.collection('list').doc(task.id).delete();

    return task;
  }

  @override
  Future<Task> editTask({required Task task}) async {
    final storedTask = await TaskAdapter.toMap(task);

    final db = FirebaseFirestore.instance;

    await db.collection("list").doc(task.id).update(storedTask);

    return task;
  }
}
