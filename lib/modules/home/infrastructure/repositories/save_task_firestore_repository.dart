import 'package:list_firestore/modules/home/domain/dto/store_task_dto.dart';
import 'package:list_firestore/modules/home/domain/entities/task.dart';
import 'package:list_firestore/modules/home/domain/exceptions/store_task_exceptions.dart';
import 'package:list_firestore/modules/home/infrastructure/datasources/i_task_datasource.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/repositories/i_save_task_firestore_repository.dart';

class SaveTaskFirestoreRepository implements ISaveTaskFirestoreRepository {
  final ITaskDatasource _datasource;

  const SaveTaskFirestoreRepository(this._datasource);

  @override
  AsyncResult<Task, NewTaskException> saveTask(StoreTaskDTO dto) async {
    try {
      final task = await _datasource.storeTask(
        task: dto.task,
      );
      return Success(task);
    } catch (exception) {
      return Failure(
        UnableToStoreTaskException(
          description: '$exception',
          error: exception,
        ),
      );
    }
  }
}
