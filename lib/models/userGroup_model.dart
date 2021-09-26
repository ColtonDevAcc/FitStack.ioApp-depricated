import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'userGroup_model.freezed.dart';
part 'userGroup_model.g.dart';

@freezed
abstract class UserGroup implements _$UserGroup {
  const UserGroup._();

  factory UserGroup({
    String? id,
    required String name,
    @Default(false) bool obtained,
  }) = _UserGroup;

  factory UserGroup.empty() => UserGroup(name: '');

  factory UserGroup.fromJson(Map<String, dynamic> json) => _$UserGroupFromJson(json);

  factory UserGroup.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserGroup.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}

//!flutter packages pub run build_runner watch --delete-conflitcting-outputs