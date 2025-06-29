// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Follow _$FollowFromJson(Map<String, dynamic> json) => Follow(
  itemType: json['itemType'] as String?,
  itemId: (json['itemId'] as num?)?.toInt(),
  followed: json['followed'] as bool?,
);

Map<String, dynamic> _$FollowToJson(Follow instance) => <String, dynamic>{
  'itemType': instance.itemType,
  'itemId': instance.itemId,
  'followed': instance.followed,
};
