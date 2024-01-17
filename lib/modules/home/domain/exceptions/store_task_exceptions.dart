import '../../../../core/exceptions/abstractions/app_exception.dart';

class NewTaskException extends AppException {
  NewTaskException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class UnableToStoreTaskException extends NewTaskException {
  UnableToStoreTaskException({
    required super.description,
    super.error,
    super.stackTrace,
  });
}

class FirestoreException extends NewTaskException {
  FirestoreException({
    super.description = 'Firestore error',
    super.stackTrace,
  });
}
