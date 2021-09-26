// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'userGroup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserGroup _$UserGroupFromJson(Map<String, dynamic> json) {
  return _UserGroup.fromJson(json);
}

/// @nodoc
class _$UserGroupTearOff {
  const _$UserGroupTearOff();

  _UserGroup call({String? id, required String name, bool obtained = false}) {
    return _UserGroup(
      id: id,
      name: name,
      obtained: obtained,
    );
  }

  UserGroup fromJson(Map<String, Object> json) {
    return UserGroup.fromJson(json);
  }
}

/// @nodoc
const $UserGroup = _$UserGroupTearOff();

/// @nodoc
mixin _$UserGroup {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get obtained => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserGroupCopyWith<UserGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserGroupCopyWith<$Res> {
  factory $UserGroupCopyWith(UserGroup value, $Res Function(UserGroup) then) =
      _$UserGroupCopyWithImpl<$Res>;
  $Res call({String? id, String name, bool obtained});
}

/// @nodoc
class _$UserGroupCopyWithImpl<$Res> implements $UserGroupCopyWith<$Res> {
  _$UserGroupCopyWithImpl(this._value, this._then);

  final UserGroup _value;
  // ignore: unused_field
  final $Res Function(UserGroup) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? obtained = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      obtained: obtained == freezed
          ? _value.obtained
          : obtained // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$UserGroupCopyWith<$Res> implements $UserGroupCopyWith<$Res> {
  factory _$UserGroupCopyWith(
          _UserGroup value, $Res Function(_UserGroup) then) =
      __$UserGroupCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String name, bool obtained});
}

/// @nodoc
class __$UserGroupCopyWithImpl<$Res> extends _$UserGroupCopyWithImpl<$Res>
    implements _$UserGroupCopyWith<$Res> {
  __$UserGroupCopyWithImpl(_UserGroup _value, $Res Function(_UserGroup) _then)
      : super(_value, (v) => _then(v as _UserGroup));

  @override
  _UserGroup get _value => super._value as _UserGroup;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? obtained = freezed,
  }) {
    return _then(_UserGroup(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      obtained: obtained == freezed
          ? _value.obtained
          : obtained // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@freezed
class _$_UserGroup extends _UserGroup with DiagnosticableTreeMixin {
  _$_UserGroup({this.id, required this.name, this.obtained = false})
      : super._();

  factory _$_UserGroup.fromJson(Map<String, dynamic> json) =>
      _$_$_UserGroupFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @JsonKey(defaultValue: false)
  @override
  final bool obtained;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserGroup(id: $id, name: $name, obtained: $obtained)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserGroup'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('obtained', obtained));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserGroup &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.obtained, obtained) ||
                const DeepCollectionEquality()
                    .equals(other.obtained, obtained)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(obtained);

  @JsonKey(ignore: true)
  @override
  _$UserGroupCopyWith<_UserGroup> get copyWith =>
      __$UserGroupCopyWithImpl<_UserGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserGroupToJson(this);
  }
}

abstract class _UserGroup extends UserGroup {
  factory _UserGroup({String? id, required String name, bool obtained}) =
      _$_UserGroup;
  _UserGroup._() : super._();

  factory _UserGroup.fromJson(Map<String, dynamic> json) =
      _$_UserGroup.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  bool get obtained => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserGroupCopyWith<_UserGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
