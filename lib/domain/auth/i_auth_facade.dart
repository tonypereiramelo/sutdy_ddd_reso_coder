import 'package:dartz/dartz.dart';
import 'package:ddd_study/domain/auth/auth_failure.dart';
import 'package:ddd_study/domain/auth/user.dart';
import 'package:ddd_study/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  Future<Option<UserDomain>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signWithGoogle();
  Future<void> signOut();
}
