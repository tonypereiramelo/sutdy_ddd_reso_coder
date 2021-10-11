import 'package:ddd_study/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        'Encourented a ValueFailure at an undercoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
