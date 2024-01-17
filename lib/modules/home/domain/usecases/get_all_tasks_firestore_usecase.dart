import 'package:list_firestore/modules/home/domain/repositories/i_task_repository.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/abstractions/app_exception.dart';
import '../entities/task.dart';

abstract class IGetAllTasksFirestoreUsecase {
  AsyncResult<List<Task>, AppException> call();
}

class GetAllTasksFirestoreUsecase implements IGetAllTasksFirestoreUsecase {
  final ITaskRepository _repository;

  const GetAllTasksFirestoreUsecase(this._repository);

  @override
  AsyncResult<List<Task>, AppException> call() {
    return _repository.getAll();
  }
}
