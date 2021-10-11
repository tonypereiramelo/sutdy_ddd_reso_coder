import 'package:ddd_study/domain/auth/user.dart';
import 'package:ddd_study/domain/core/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserDomainX on User {
  UserDomain toDomain() {
    return UserDomain(id: UniqueId.fromUniqueString(uid));
  }
}
