import 'package:list_firestore/modules/home/domain/entities/task.dart';

abstract class ITaskDatasource {
  Future<Task> storeTask({required Task task});
}
