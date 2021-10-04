// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String?,
    userName: json['userName'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    nationality: json['nationality'] as String,
    email: json['email'] as String,
    admin: json['admin'] as bool,
    height: (json['height'] as num).toDouble(),
    age: json['age'] as int,
    gender: json['gender'] as String,
    weight: (json['weight'] as num).toDouble(),
    mainWorkoutGoal: json['mainWorkoutGoal'] as String,
    workoutFrequency: json['workoutFrequency'] as String,
    workoutExperiencelevel: json['workoutExperiencelevel'] as String,
    tags: json['tags'] as List<dynamic>?,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'nationality': instance.nationality,
      'email': instance.email,
      'admin': instance.admin,
      'height': instance.height,
      'age': instance.age,
      'gender': instance.gender,
      'weight': instance.weight,
      'mainWorkoutGoal': instance.mainWorkoutGoal,
      'workoutFrequency': instance.workoutFrequency,
      'workoutExperiencelevel': instance.workoutExperiencelevel,
      'tags': instance.tags,
    };
