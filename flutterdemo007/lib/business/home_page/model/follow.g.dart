// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Follow _$FollowFromJson(Map<String, dynamic> json) => Follow(
  json['itemType'] as String?,
  (json['itemId'] as num?)?.toInt(),
  json['followed'] as bool?,
);

Map<String, dynamic> _$FollowToJson(Follow instance) => <String, dynamic>{
  'itemType': instance.itemType,
  'itemId': instance.itemId,
  'followed': instance.followed,
};
