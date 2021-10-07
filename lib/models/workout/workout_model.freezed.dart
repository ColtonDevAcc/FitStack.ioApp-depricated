// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'workout_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return _Workout.fromJson(json);
}

/// @nodoc
class _$WorkoutTearOff {
  const _$WorkoutTearOff();

  _Workout call(
      {required String workoutName,
      required List<dynamic> reps,
      required int sets,
      required List<dynamic> weight,
      String? id,
      List<dynamic>? muscleGroups,
      List<dynamic>? tags}) {
    return _Workout(
      workoutName: workoutName,
      reps: reps,
      sets: sets,
      weight: weight,
      id: id,
      muscleGroups: muscleGroups,
      tags: tags,
    );
  }

  Workout fromJson(Map<String, Object> json) {
    return Workout.fromJson(json);
  }
}

/// @nodoc
const $Workout = _$WorkoutTearOff();

/// @nodoc
mixin _$Workout {
  String get workoutName => throw _privateConstructorUsedError;
  List<dynamic> get reps => throw _privateConstructorUsedError;
  int get sets => throw _privateConstructorUsedError;
  List<dynamic> get weight => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  List<dynamic>? get muscleGroups => throw _privateConstructorUsedError;
  List<dynamic>? get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutCopyWith<Workout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCopyWith<$Res> {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) then) =
      _$WorkoutCopyWithImpl<$Res>;
  $Res call(
      {String workoutName,
      List<dynamic> reps,
      int sets,
      List<dynamic> weight,
      String? id,
      List<dynamic>? muscleGroups,
      List<dynamic>? tags});
}

/// @nodoc
class _$WorkoutCopyWithImpl<$Res> implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._value, this._then);

  final Workout _value;
  // ignore: unused_field
  final $Res Function(Workout) _then;

  @override
  $Res call({
    Object? workoutName = freezed,
    Object? reps = freezed,
    Object? sets = freezed,
    Object? weight = freezed,
    Object? id = freezed,
    Object? muscleGroups = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      workoutName: workoutName == freezed
          ? _value.workoutName
          : workoutName // ignore: cast_nullable_to_non_nullable
              as String,
      reps: reps == freezed
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      sets: sets == freezed
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      muscleGroups: muscleGroups == freezed
          ? _value.muscleGroups
          : muscleGroups // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$WorkoutCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$WorkoutCopyWith(_Workout value, $Res Function(_Workout) then) =
      __$WorkoutCopyWithImpl<$Res>;
  @override
  $Res call(
      {String workoutName,
      List<dynamic> reps,
      int sets,
      List<dynamic> weight,
      String? id,
      List<dynamic>? muscleGroups,
      List<dynamic>? tags});
}

/// @nodoc
class __$WorkoutCopyWithImpl<$Res> extends _$WorkoutCopyWithImpl<$Res>
    implements _$WorkoutCopyWith<$Res> {
  __$WorkoutCopyWithImpl(_Workout _value, $Res Function(_Workout) _then)
      : super(_value, (v) => _then(v as _Workout));

  @override
  _Workout get _value => super._value as _Workout;

  @override
  $Res call({
    Object? workoutName = freezed,
    Object? reps = freezed,
    Object? sets = freezed,
    Object? weight = freezed,
    Object? id = freezed,
    Object? muscleGroups = freezed,
    Object? tags = freezed,
  }) {
    return _then(_Workout(
      workoutName: workoutName == freezed
          ? _value.workoutName
          : workoutName // ignore: cast_nullable_to_non_nullable
              as String,
      reps: reps == freezed
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      sets: sets == freezed
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      muscleGroups: muscleGroups == freezed
          ? _value.muscleGroups
          : muscleGroups // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Workout extends _Workout with DiagnosticableTreeMixin {
  _$_Workout(
      {required this.workoutName,
      required this.reps,
      required this.sets,
      required this.weight,
      this.id,
      this.muscleGroups,
      this.tags})
      : super._();

  factory _$_Workout.fromJson(Map<String, dynamic> json) =>
      _$_$_WorkoutFromJson(json);

  @override
  final String workoutName;
  @override
  final List<dynamic> reps;
  @override
  final int sets;
  @override
  final List<dynamic> weight;
  @override
  final String? id;
  @override
  final List<dynamic>? muscleGroups;
  @override
  final List<dynamic>? tags;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Workout(workoutName: $workoutName, reps: $reps, sets: $sets, weight: $weight, id: $id, muscleGroups: $muscleGroups, tags: $tags)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Workout'))
      ..add(DiagnosticsProperty('workoutName', workoutName))
      ..add(DiagnosticsProperty('reps', reps))
      ..add(DiagnosticsProperty('sets', sets))
      ..add(DiagnosticsProperty('weight', weight))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('muscleGroups', muscleGroups))
      ..add(DiagnosticsProperty('tags', tags));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Workout &&
            (identical(other.workoutName, workoutName) ||
                const DeepCollectionEquality()
                    .equals(other.workoutName, workoutName)) &&
            (identical(other.reps, reps) ||
                const DeepCollectionEquality().equals(other.reps, reps)) &&
            (identical(other.sets, sets) ||
                const DeepCollectionEquality().equals(other.sets, sets)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.muscleGroups, muscleGroups) ||
                const DeepCollectionEquality()
                    .equals(other.muscleGroups, muscleGroups)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(workoutName) ^
      const DeepCollectionEquality().hash(reps) ^
      const DeepCollectionEquality().hash(sets) ^
      const DeepCollectionEquality().hash(weight) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(muscleGroups) ^
      const DeepCollectionEquality().hash(tags);

  @JsonKey(ignore: true)
  @override
  _$WorkoutCopyWith<_Workout> get copyWith =>
      __$WorkoutCopyWithImpl<_Workout>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WorkoutToJson(this);
  }
}

abstract class _Workout extends Workout {
  factory _Workout(
      {required String workoutName,
      required List<dynamic> reps,
      required int sets,
      required List<dynamic> weight,
      String? id,
      List<dynamic>? muscleGroups,
      List<dynamic>? tags}) = _$_Workout;
  _Workout._() : super._();

  factory _Workout.fromJson(Map<String, dynamic> json) = _$_Workout.fromJson;

  @override
  String get workoutName => throw _privateConstructorUsedError;
  @override
  List<dynamic> get reps => throw _privateConstructorUsedError;
  @override
  int get sets => throw _privateConstructorUsedError;
  @override
  List<dynamic> get weight => throw _privateConstructorUsedError;
  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  List<dynamic>? get muscleGroups => throw _privateConstructorUsedError;
  @override
  List<dynamic>? get tags => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WorkoutCopyWith<_Workout> get copyWith =>
      throw _privateConstructorUsedError;
}
