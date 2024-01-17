import 'package:list_firestore/modules/home/domain/dto/store_task_dto.dart';
import 'package:list_firestore/modules/home/domain/entities/task.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/abstractions/app_exception.dart';
import '../repositories/i_task_repository.dart';

abstract class IDeleteTaskFirestoreUsecase {
  AsyncResult<Task, AppException> call(StoreTaskDTO dto);
}

class DeleteTaskFirestoreUsecase implements IDeleteTaskFirestoreUsecase {
  final ITaskRepository _repository;

  const DeleteTaskFirestoreUsecase(this._repository);

  @override
  AsyncResult<Task, AppException> call(StoreTaskDTO dto) {
    return _repository.deleteTask(dto);
  }
}
