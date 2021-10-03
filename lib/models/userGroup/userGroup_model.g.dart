// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userGroup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserGroup _$_$_UserGroupFromJson(Map<String, dynamic> json) {
  return _$_UserGroup(
    id: json['id'] as String?,
    name: json['name'] as String,
    userIdList: (json['userIdList'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    moderaterList: (json['moderaterList'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    ownerList:
        (json['ownerList'] as List<dynamic>?)?.map((e) => e as String).toList(),
    bannerImageURL: json['bannerImageURL'] as String?,
    obtained: json['obtained'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_UserGroupToJson(_$_UserGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userIdList': instance.userIdList,
      'moderaterList': instance.moderaterList,
      'ownerList': instance.ownerList,
      'bannerImageURL': instance.bannerImageURL,
      'obtained': instance.obtained,
    };
