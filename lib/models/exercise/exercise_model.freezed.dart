// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'exercise_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return _Exercise.fromJson(json);
}

/// @nodoc
class _$ExerciseTearOff {
  const _$ExerciseTearOff();

  _Exercise call(
      {required String exerciseTitle,
      required List<PrimaryMuscleGroups> muscleGroup,
      required List<int> reps,
      required int sets,
      String? id,
      List<dynamic>? muscleGroups,
      List<dynamic>? tags}) {
    return _Exercise(
      exerciseTitle: exerciseTitle,
      muscleGroup: muscleGroup,
      reps: reps,
      sets: sets,
      id: id,
      muscleGroups: muscleGroups,
      tags: tags,
    );
  }

  Exercise fromJson(Map<String, Object> json) {
    return Exercise.fromJson(json);
  }
}

/// @nodoc
const $Exercise = _$ExerciseTearOff();

/// @nodoc
mixin _$Exercise {
  String get exerciseTitle => throw _privateConstructorUsedError;
  List<PrimaryMuscleGroups> get muscleGroup =>
      throw _privateConstructorUsedError;
  List<int> get reps => throw _privateConstructorUsedError;
  int get sets => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  List<dynamic>? get muscleGroups => throw _privateConstructorUsedError;
  List<dynamic>? get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseCopyWith<Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) then) =
      _$ExerciseCopyWithImpl<$Res>;
  $Res call(
      {String exerciseTitle,
      List<PrimaryMuscleGroups> muscleGroup,
      List<int> reps,
      int sets,
      String? id,
      List<dynamic>? muscleGroups,
      List<dynamic>? tags});
}

/// @nodoc
class _$ExerciseCopyWithImpl<$Res> implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._value, this._then);

  final Exercise _value;
  // ignore: unused_field
  final $Res Function(Exercise) _then;

  @override
  $Res call({
    Object? exerciseTitle = freezed,
    Object? muscleGroup = freezed,
    Object? reps = freezed,
    Object? sets = freezed,
    Object? id = freezed,
    Object? muscleGroups = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      exerciseTitle: exerciseTitle == freezed
          ? _value.exerciseTitle
          : exerciseTitle // ignore: cast_nullable_to_non_nullable
              as String,
      muscleGroup: muscleGroup == freezed
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as List<PrimaryMuscleGroups>,
      reps: reps == freezed
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as List<int>,
      sets: sets == freezed
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$ExerciseCopyWith<$Res> implements $ExerciseCopyWith<$Res> {
  factory _$ExerciseCopyWith(_Exercise value, $Res Function(_Exercise) then) =
      __$ExerciseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String exerciseTitle,
      List<PrimaryMuscleGroups> muscleGroup,
      List<int> reps,
      int sets,
      String? id,
      List<dynamic>? muscleGroups,
      List<dynamic>? tags});
}

/// @nodoc
class __$ExerciseCopyWithImpl<$Res> extends _$ExerciseCopyWithImpl<$Res>
    implements _$ExerciseCopyWith<$Res> {
  __$ExerciseCopyWithImpl(_Exercise _value, $Res Function(_Exercise) _then)
      : super(_value, (v) => _then(v as _Exercise));

  @override
  _Exercise get _value => super._value as _Exercise;

  @override
  $Res call({
    Object? exerciseTitle = freezed,
    Object? muscleGroup = freezed,
    Object? reps = freezed,
    Object? sets = freezed,
    Object? id = freezed,
    Object? muscleGroups = freezed,
    Object? tags = freezed,
  }) {
    return _then(_Exercise(
      exerciseTitle: exerciseTitle == freezed
          ? _value.exerciseTitle
          : exerciseTitle // ignore: cast_nullable_to_non_nullable
              as String,
      muscleGroup: muscleGroup == freezed
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as List<PrimaryMuscleGroups>,
      reps: reps == freezed
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as List<int>,
      sets: sets == freezed
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_Exercise extends _Exercise with DiagnosticableTreeMixin {
  _$_Exercise(
      {required this.exerciseTitle,
      required this.muscleGroup,
      required this.reps,
      required this.sets,
      this.id,
      this.muscleGroups,
      this.tags})
      : super._();

  factory _$_Exercise.fromJson(Map<String, dynamic> json) =>
      _$_$_ExerciseFromJson(json);

  @override
  final String exerciseTitle;
  @override
  final List<PrimaryMuscleGroups> muscleGroup;
  @override
  final List<int> reps;
  @override
  final int sets;
  @override
  final String? id;
  @override
  final List<dynamic>? muscleGroups;
  @override
  final List<dynamic>? tags;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Exercise(exerciseTitle: $exerciseTitle, muscleGroup: $muscleGroup, reps: $reps, sets: $sets, id: $id, muscleGroups: $muscleGroups, tags: $tags)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Exercise'))
      ..add(DiagnosticsProperty('exerciseTitle', exerciseTitle))
      ..add(DiagnosticsProperty('muscleGroup', muscleGroup))
      ..add(DiagnosticsProperty('reps', reps))
      ..add(DiagnosticsProperty('sets', sets))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('muscleGroups', muscleGroups))
      ..add(DiagnosticsProperty('tags', tags));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Exercise &&
            (identical(other.exerciseTitle, exerciseTitle) ||
                const DeepCollectionEquality()
                    .equals(other.exerciseTitle, exerciseTitle)) &&
            (identical(other.muscleGroup, muscleGroup) ||
                const DeepCollectionEquality()
                    .equals(other.muscleGroup, muscleGroup)) &&
            (identical(other.reps, reps) ||
                const DeepCollectionEquality().equals(other.reps, reps)) &&
            (identical(other.sets, sets) ||
                const DeepCollectionEquality().equals(other.sets, sets)) &&
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
      const DeepCollectionEquality().hash(exerciseTitle) ^
      const DeepCollectionEquality().hash(muscleGroup) ^
      const DeepCollectionEquality().hash(reps) ^
      const DeepCollectionEquality().hash(sets) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(muscleGroups) ^
      const DeepCollectionEquality().hash(tags);

  @JsonKey(ignore: true)
  @override
  _$ExerciseCopyWith<_Exercise> get copyWith =>
      __$ExerciseCopyWithImpl<_Exercise>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ExerciseToJson(this);
  }
}

abstract class _Exercise extends Exercise {
  factory _Exercise(
      {required String exerciseTitle,
      required List<PrimaryMuscleGroups> muscleGroup,
      required List<int> reps,
      required int sets,
      String? id,
      List<dynamic>? muscleGroups,
      List<dynamic>? tags}) = _$_Exercise;
  _Exercise._() : super._();

  factory _Exercise.fromJson(Map<String, dynamic> json) = _$_Exercise.fromJson;

  @override
  String get exerciseTitle => throw _privateConstructorUsedError;
  @override
  List<PrimaryMuscleGroups> get muscleGroup =>
      throw _privateConstructorUsedError;
  @override
  List<int> get reps => throw _privateConstructorUsedError;
  @override
  int get sets => throw _privateConstructorUsedError;
  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  List<dynamic>? get muscleGroups => throw _privateConstructorUsedError;
  @override
  List<dynamic>? get tags => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ExerciseCopyWith<_Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}
