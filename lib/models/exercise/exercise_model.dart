import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitstack/models/recovery/recovery_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

@freezed
abstract class Exercise implements _$Exercise {
  const Exercise._();

  factory Exercise({
    required String exerciseTitle,
    required List<PrimaryMuscleGroups> muscleGroup,
    required List<int> reps,
    required int sets,
    String? id,
    List? muscleGroups,
    List? tags,
  }) = _Exercise;

  factory Exercise.empty() => Exercise(
        reps: [],
        sets: 0,
        tags: [],
        muscleGroups: [],
        muscleGroup: [],
        exerciseTitle: '',
      );

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);

  factory Exercise.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Exercise.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}

//!flutter packages pub run build_runner watch --delete-conflicting-outputs