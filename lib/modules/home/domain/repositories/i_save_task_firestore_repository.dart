import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/abstractions/app_exception.dart';
import '../dto/store_task_dto.dart';
import '../entities/task.dart';

abstract class ISaveTaskFirestoreRepository {
  AsyncResult<Task, AppException> saveTask(StoreTaskDTO dto);
}
