import 'package:list_firestore/modules/home/domain/repositories/i_task_repository.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/abstractions/app_exception.dart';
import '../dto/store_task_dto.dart';
import '../entities/task.dart';

abstract class IEditTaskFirestoreUsecase {
  AsyncResult<Task, AppException> call(StoreTaskDTO dto);
}

class EditTaskFirestoreUsecase implements IEditTaskFirestoreUsecase {
  final ITaskRepository _repository;

  const EditTaskFirestoreUsecase(this._repository);

  @override
  AsyncResult<Task, AppException> call(StoreTaskDTO dto) {
    return _repository.editTask(dto);
  }
}
