import '../../../../core/exceptions/abstractions/app_exception.dart';

class DeleteTaskException extends AppException {
  DeleteTaskException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class UnableToDeleteTaskException extends DeleteTaskException {
  UnableToDeleteTaskException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class UnableToEditTaskException extends DeleteTaskException {
  UnableToEditTaskException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class DeleteTaskFirestoreException extends DeleteTaskException {
  DeleteTaskFirestoreException({
    super.description = 'Firestore error',
    super.stackTrace,
  });
}
