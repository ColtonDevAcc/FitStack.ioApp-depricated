// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Exercise _$_$_ExerciseFromJson(Map<String, dynamic> json) {
  return _$_Exercise(
    exerciseTitle: json['exerciseTitle'] as String,
    muscleGroup: (json['muscleGroup'] as List<dynamic>)
        .map((e) => _$enumDecode(_$PrimaryMuscleGroupsEnumMap, e))
        .toList(),
    reps: (json['reps'] as List<dynamic>).map((e) => e as int).toList(),
    sets: json['sets'] as int,
    id: json['id'] as String?,
    muscleGroups: json['muscleGroups'] as List<dynamic>?,
    tags: json['tags'] as List<dynamic>?,
  );
}

Map<String, dynamic> _$_$_ExerciseToJson(_$_Exercise instance) =>
    <String, dynamic>{
      'exerciseTitle': instance.exerciseTitle,
      'muscleGroup': instance.muscleGroup
          .map((e) => _$PrimaryMuscleGroupsEnumMap[e])
          .toList(),
      'reps': instance.reps,
      'sets': instance.sets,
      'id': instance.id,
      'muscleGroups': instance.muscleGroups,
      'tags': instance.tags,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$PrimaryMuscleGroupsEnumMap = {
  PrimaryMuscleGroups.empty: 'empty',
  PrimaryMuscleGroups.vastusLateralist: 'vastusLateralist',
  PrimaryMuscleGroups.brachioradialis: 'brachioradialis',
  PrimaryMuscleGroups.hand: 'hand',
  PrimaryMuscleGroups.abdominals: 'abdominals',
  PrimaryMuscleGroups.biceps: 'biceps',
  PrimaryMuscleGroups.calves: 'calves',
  PrimaryMuscleGroups.deltoids: 'deltoids',
  PrimaryMuscleGroups.forearms: 'forearms',
  PrimaryMuscleGroups.gluteals: 'gluteals',
  PrimaryMuscleGroups.hamstrings: 'hamstrings',
  PrimaryMuscleGroups.latissimusDorsi: 'latissimusDorsi',
  PrimaryMuscleGroups.pectorals: 'pectorals',
  PrimaryMuscleGroups.obliques: 'obliques',
  PrimaryMuscleGroups.quadriceps: 'quadriceps',
  PrimaryMuscleGroups.trapezius: 'trapezius',
  PrimaryMuscleGroups.triceps: 'triceps',
};
