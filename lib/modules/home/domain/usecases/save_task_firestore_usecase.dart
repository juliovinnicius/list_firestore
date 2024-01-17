import 'package:list_firestore/core/exceptions/abstractions/app_exception.dart';
import 'package:list_firestore/modules/home/domain/dto/store_task_dto.dart';
import 'package:list_firestore/modules/home/domain/entities/task.dart';
import 'package:list_firestore/modules/home/domain/repositories/i_task_repository.dart';
import 'package:result_dart/result_dart.dart';

abstract class ISaveTaskFirestoreUsecase {
  AsyncResult<Task, AppException> call(StoreTaskDTO dto);
}

class SaveTaskFirestoreUsecase implements ISaveTaskFirestoreUsecase {
  final ITaskRepository _repository;

  const SaveTaskFirestoreUsecase(this._repository);

  @override
  AsyncResult<Task, AppException> call(StoreTaskDTO dto) async {
    return _repository.saveTask(dto);
  }
}
