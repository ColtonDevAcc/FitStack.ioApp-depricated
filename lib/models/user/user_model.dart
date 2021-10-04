import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class User implements _$User {
  const User._();

  factory User({
    String? id,
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
    List? tags,
  }) = _User;

  factory User.empty() => User(
        userName: '',
        firstName: '',
        lastName: '',
        nationality: '',
        email: '',
        admin: false,
        height: 0,
        age: 0,
        gender: '',
        weight: 0.0,
        mainWorkoutGoal: '',
        workoutFrequency: '',
        workoutExperiencelevel: '',
        tags: [],
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return User.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}

//!flutter packages pub run build_runner watch --delete-conflicting-outputs