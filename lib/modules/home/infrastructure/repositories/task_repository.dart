import 'package:list_firestore/core/exceptions/abstractions/app_exception.dart';
import 'package:list_firestore/modules/home/domain/dto/store_task_dto.dart';
import 'package:list_firestore/modules/home/domain/entities/task.dart';
import 'package:list_firestore/modules/home/domain/exceptions/delete_task_exceptions.dart';
import 'package:list_firestore/modules/home/domain/exceptions/get_all_tasks_exceptions.dart';
import 'package:list_firestore/modules/home/domain/exceptions/store_task_exceptions.dart';
import 'package:list_firestore/modules/home/infrastructure/datasources/i_task_datasource.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/repositories/i_task_repository.dart';

class TaskRepository implements ITaskRepository {
  final ITaskDatasource _datasource;

  const TaskRepository(this._datasource);

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

  @override
  AsyncResult<List<Task>, GetAllTasksException> getAll() async {
    try {
      final listTasks = await _datasource.getTasks();
      return Success(listTasks);
    } catch (exception) {
      return Failure(
        UnableToGetAllTaskException(
          description: '$exception',
          error: exception,
        ),
      );
    }
  }

  @override
  AsyncResult<Task, AppException> deleteTask(StoreTaskDTO dto) async {
    try {
      final task = await _datasource.deleteTask(
        task: dto.task,
      );
      return Success(task);
    } catch (exception) {
      return Failure(
        UnableToDeleteTaskException(
          description: '$exception',
          error: exception,
        ),
      );
    }
  }

  @override
  AsyncResult<Task, AppException> editTask(StoreTaskDTO dto) async {
    try {
      final task = await _datasource.editTask(
        task: dto.task,
      );
      return Success(task);
    } catch (exception) {
      return Failure(
        UnableToEditTaskException(
          description: '$exception',
          error: exception,
        ),
      );
    }
  }
}
