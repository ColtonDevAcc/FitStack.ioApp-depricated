import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'recovery_model.freezed.dart';
part 'recovery_model.g.dart';

@freezed
abstract class RecoveryModel implements _$RecoveryModel {
  const RecoveryModel._();

  factory RecoveryModel({
    String? id,
    required String muscleGroup,
    required String muscleName,
    required String path,
    required Color color,
    required bool selectable,
  }) = _RecoveryModel;

  factory RecoveryModel.empty() => RecoveryModel(
        muscleName: '',
        muscleGroup: '',
        path: '',
        selectable: false,
        color: Colors.black,
      );

  factory RecoveryModel.fromJson(Map<String, dynamic> json) => _$RecoveryModelFromJson(json);

  factory RecoveryModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return RecoveryModel.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}

//!flutter packages pub run build_runner watch --delete-conflicting-outputs