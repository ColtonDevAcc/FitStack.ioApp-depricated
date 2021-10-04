// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {String? id,
      required String userName,
      required String firstName,
      required String lastName,
      required String nationality,
      required String email,
      required bool admin,
      required double height,
      required int age,
      required String gender,
      required double weight,
      required String mainWorkoutGoal,
      required String workoutFrequency,
      required String workoutExperiencelevel,
      List<dynamic>? tags}) {
    return _User(
      id: id,
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      nationality: nationality,
      email: email,
      admin: admin,
      height: height,
      age: age,
      gender: gender,
      weight: weight,
      mainWorkoutGoal: mainWorkoutGoal,
      workoutFrequency: workoutFrequency,
      workoutExperiencelevel: workoutExperiencelevel,
      tags: tags,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String? get id => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get nationality => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get admin => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  String get mainWorkoutGoal => throw _privateConstructorUsedError;
  String get workoutFrequency => throw _privateConstructorUsedError;
  String get workoutExperiencelevel => throw _privateConstructorUsedError;
  List<dynamic>? get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String userName,
      String firstName,
      String lastName,
      String nationality,
      String email,
      bool admin,
      double height,
      int age,
      String gender,
      double weight,
      String mainWorkoutGoal,
      String workoutFrequency,
      String workoutExperiencelevel,
      List<dynamic>? tags});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? nationality = freezed,
    Object? email = freezed,
    Object? admin = freezed,
    Object? height = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? weight = freezed,
    Object? mainWorkoutGoal = freezed,
    Object? workoutFrequency = freezed,
    Object? workoutExperiencelevel = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: nationality == freezed
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      admin: admin == freezed
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as bool,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      mainWorkoutGoal: mainWorkoutGoal == freezed
          ? _value.mainWorkoutGoal
          : mainWorkoutGoal // ignore: cast_nullable_to_non_nullable
              as String,
      workoutFrequency: workoutFrequency == freezed
          ? _value.workoutFrequency
          : workoutFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      workoutExperiencelevel: workoutExperiencelevel == freezed
          ? _value.workoutExperiencelevel
          : workoutExperiencelevel // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String userName,
      String firstName,
      String lastName,
      String nationality,
      String email,
      bool admin,
      double height,
      int age,
      String gender,
      double weight,
      String mainWorkoutGoal,
      String workoutFrequency,
      String workoutExperiencelevel,
      List<dynamic>? tags});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? nationality = freezed,
    Object? email = freezed,
    Object? admin = freezed,
    Object? height = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? weight = freezed,
    Object? mainWorkoutGoal = freezed,
    Object? workoutFrequency = freezed,
    Object? workoutExperiencelevel = freezed,
    Object? tags = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: nationality == freezed
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      admin: admin == freezed
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as bool,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      mainWorkoutGoal: mainWorkoutGoal == freezed
          ? _value.mainWorkoutGoal
          : mainWorkoutGoal // ignore: cast_nullable_to_non_nullable
              as String,
      workoutFrequency: workoutFrequency == freezed
          ? _value.workoutFrequency
          : workoutFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      workoutExperiencelevel: workoutExperiencelevel == freezed
          ? _value.workoutExperiencelevel
          : workoutExperiencelevel // ignore: cast_nullable_to_non_nullable
              as String,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User with DiagnosticableTreeMixin {
  _$_User(
      {this.id,
      required this.userName,
      required this.firstName,
      required this.lastName,
      required this.nationality,
      required this.email,
      required this.admin,
      required this.height,
      required this.age,
      required this.gender,
      required this.weight,
      required this.mainWorkoutGoal,
      required this.workoutFrequency,
      required this.workoutExperiencelevel,
      this.tags})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String? id;
  @override
  final String userName;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String nationality;
  @override
  final String email;
  @override
  final bool admin;
  @override
  final double height;
  @override
  final int age;
  @override
  final String gender;
  @override
  final double weight;
  @override
  final String mainWorkoutGoal;
  @override
  final String workoutFrequency;
  @override
  final String workoutExperiencelevel;
  @override
  final List<dynamic>? tags;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(id: $id, userName: $userName, firstName: $firstName, lastName: $lastName, nationality: $nationality, email: $email, admin: $admin, height: $height, age: $age, gender: $gender, weight: $weight, mainWorkoutGoal: $mainWorkoutGoal, workoutFrequency: $workoutFrequency, workoutExperiencelevel: $workoutExperiencelevel, tags: $tags)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('nationality', nationality))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('admin', admin))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('age', age))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('weight', weight))
      ..add(DiagnosticsProperty('mainWorkoutGoal', mainWorkoutGoal))
      ..add(DiagnosticsProperty('workoutFrequency', workoutFrequency))
      ..add(
          DiagnosticsProperty('workoutExperiencelevel', workoutExperiencelevel))
      ..add(DiagnosticsProperty('tags', tags));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.nationality, nationality) ||
                const DeepCollectionEquality()
                    .equals(other.nationality, nationality)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.admin, admin) ||
                const DeepCollectionEquality().equals(other.admin, admin)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)) &&
            (identical(other.mainWorkoutGoal, mainWorkoutGoal) ||
                const DeepCollectionEquality()
                    .equals(other.mainWorkoutGoal, mainWorkoutGoal)) &&
            (identical(other.workoutFrequency, workoutFrequency) ||
                const DeepCollectionEquality()
                    .equals(other.workoutFrequency, workoutFrequency)) &&
            (identical(other.workoutExperiencelevel, workoutExperiencelevel) ||
                const DeepCollectionEquality().equals(
                    other.workoutExperiencelevel, workoutExperiencelevel)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(nationality) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(admin) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(weight) ^
      const DeepCollectionEquality().hash(mainWorkoutGoal) ^
      const DeepCollectionEquality().hash(workoutFrequency) ^
      const DeepCollectionEquality().hash(workoutExperiencelevel) ^
      const DeepCollectionEquality().hash(tags);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User extends User {
  factory _User(
      {String? id,
      required String userName,
      required String firstName,
      required String lastName,
      required String nationality,
      required String email,
      required bool admin,
      required double height,
      required int age,
      required String gender,
      required double weight,
      required String mainWorkoutGoal,
      required String workoutFrequency,
      required String workoutExperiencelevel,
      List<dynamic>? tags}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get userName => throw _privateConstructorUsedError;
  @override
  String get firstName => throw _privateConstructorUsedError;
  @override
  String get lastName => throw _privateConstructorUsedError;
  @override
  String get nationality => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  bool get admin => throw _privateConstructorUsedError;
  @override
  double get height => throw _privateConstructorUsedError;
  @override
  int get age => throw _privateConstructorUsedError;
  @override
  String get gender => throw _privateConstructorUsedError;
  @override
  double get weight => throw _privateConstructorUsedError;
  @override
  String get mainWorkoutGoal => throw _privateConstructorUsedError;
  @override
  String get workoutFrequency => throw _privateConstructorUsedError;
  @override
  String get workoutExperiencelevel => throw _privateConstructorUsedError;
  @override
  List<dynamic>? get tags => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
