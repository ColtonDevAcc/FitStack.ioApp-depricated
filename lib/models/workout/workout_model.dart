import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'workout_model.freezed.dart';
part 'workout_model.g.dart';

@freezed
abstract class Workout implements _$Workout {
  const Workout._();

  factory Workout({
    required String workoutName,
    required List reps,
    required int sets,
    required List weight,
    String? id,
    List? muscleGroups,
    List? tags,
  }) = _Workout;

  factory Workout.empty() => Workout(
        reps: [],
        weight: [],
        sets: 0,
        tags: [],
        muscleGroups: [],
        workoutName: '',
      );

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);

  factory Workout.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Workout.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}

//!flutter packages pub run build_runner watch --delete-conflicting-outputs