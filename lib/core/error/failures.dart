import 'package:movie_app/core/constants/error_codes.dart';

class Failure {
  final String message;
  final String code;

  Failure([
    this.message = 'An unexpected error occurred,',
    this.code = ErrorCodes.somethingWentWrongErrorCode,
  ]);
}
