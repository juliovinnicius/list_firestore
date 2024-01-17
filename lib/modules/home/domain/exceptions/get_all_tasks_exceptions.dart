import '../../../../core/exceptions/abstractions/app_exception.dart';

class GetAllTasksException extends AppException {
  GetAllTasksException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class UnableToGetAllTaskException extends GetAllTasksException {
  UnableToGetAllTaskException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class GetAllTaskFirestoreException extends GetAllTasksException {
  GetAllTaskFirestoreException({
    super.description = 'Firestore error',
    super.stackTrace,
  });
}
