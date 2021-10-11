// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserDomainTearOff {
  const _$UserDomainTearOff();

  _UserDomain call({required UniqueId id}) {
    return _UserDomain(
      id: id,
    );
  }
}

/// @nodoc
const $UserDomain = _$UserDomainTearOff();

/// @nodoc
mixin _$UserDomain {
  UniqueId get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDomainCopyWith<UserDomain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDomainCopyWith<$Res> {
  factory $UserDomainCopyWith(
          UserDomain value, $Res Function(UserDomain) then) =
      _$UserDomainCopyWithImpl<$Res>;
  $Res call({UniqueId id});
}

/// @nodoc
class _$UserDomainCopyWithImpl<$Res> implements $UserDomainCopyWith<$Res> {
  _$UserDomainCopyWithImpl(this._value, this._then);

  final UserDomain _value;
  // ignore: unused_field
  final $Res Function(UserDomain) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }
}

/// @nodoc
abstract class _$UserDomainCopyWith<$Res> implements $UserDomainCopyWith<$Res> {
  factory _$UserDomainCopyWith(
          _UserDomain value, $Res Function(_UserDomain) then) =
      __$UserDomainCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id});
}

/// @nodoc
class __$UserDomainCopyWithImpl<$Res> extends _$UserDomainCopyWithImpl<$Res>
    implements _$UserDomainCopyWith<$Res> {
  __$UserDomainCopyWithImpl(
      _UserDomain _value, $Res Function(_UserDomain) _then)
      : super(_value, (v) => _then(v as _UserDomain));

  @override
  _UserDomain get _value => super._value as _UserDomain;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_UserDomain(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }
}

/// @nodoc

class _$_UserDomain implements _UserDomain {
  const _$_UserDomain({required this.id});

  @override
  final UniqueId id;

  @override
  String toString() {
    return 'UserDomain(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserDomain &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$UserDomainCopyWith<_UserDomain> get copyWith =>
      __$UserDomainCopyWithImpl<_UserDomain>(this, _$identity);
}

abstract class _UserDomain implements UserDomain {
  const factory _UserDomain({required UniqueId id}) = _$_UserDomain;

  @override
  UniqueId get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserDomainCopyWith<_UserDomain> get copyWith =>
      throw _privateConstructorUsedError;
}
