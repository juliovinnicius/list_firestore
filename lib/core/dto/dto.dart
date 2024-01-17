import 'package:result_dart/result_dart.dart';

import '../exceptions/abstractions/app_exception.dart';

abstract class DTO {}

abstract class ValidationDTO extends DTO {
  Result<DTO, AppException> validate();
}
