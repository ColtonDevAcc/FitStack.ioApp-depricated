// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userGroup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserGroup _$_$_UserGroupFromJson(Map<String, dynamic> json) {
  return _$_UserGroup(
    id: json['id'] as String?,
    name: json['name'] as String,
    obtained: json['obtained'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_UserGroupToJson(_$_UserGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'obtained': instance.obtained,
    };
