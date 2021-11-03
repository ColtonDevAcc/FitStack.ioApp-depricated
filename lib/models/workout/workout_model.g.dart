// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Workout _$_$_WorkoutFromJson(Map<String, dynamic> json) {
  return _$_Workout(
    workoutName: json['workoutName'] as String,
    exercises: (json['exercises'] as List<dynamic>)
        .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
        .toList(),
    id: json['id'] as String?,
    muscleGroups: json['muscleGroups'] as List<dynamic>?,
    tags: json['tags'] as List<dynamic>?,
  );
}

Map<String, dynamic> _$_$_WorkoutToJson(_$_Workout instance) =>
    <String, dynamic>{
      'workoutName': instance.workoutName,
      'exercises': instance.exercises,
      'id': instance.id,
      'muscleGroups': instance.muscleGroups,
      'tags': instance.tags,
    };
