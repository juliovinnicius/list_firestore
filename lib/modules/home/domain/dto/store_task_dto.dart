import 'package:list_firestore/modules/home/domain/entities/task.dart';

import '../../../../core/dto/dto.dart';

class StoreTaskDTO implements DTO {
  final Task task;

  const StoreTaskDTO({required this.task});
}
