// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
  (json['id'] as num?)?.toInt(),
  json['icon'] as String?,
  json['name'] as String?,
  json['description'] as String?,
  json['link'] as String?,
  (json['latestReleaseTime'] as num?)?.toInt(),
  (json['videoNum'] as num?)?.toInt(),
  json['follow'] == null
      ? null
      : Follow.fromJson(json['follow'] as Map<String, dynamic>),
  json['shield'] == null
      ? null
      : Shield.fromJson(json['shield'] as Map<String, dynamic>),
  (json['approvedNotReadyVideoCount'] as num?)?.toInt(),
  json['ifPgc'] as bool?,
  (json['recSort'] as num?)?.toInt(),
  json['expert'] as bool?,
);

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
  'id': instance.id,
  'icon': instance.icon,
  'name': instance.name,
  'description': instance.description,
  'link': instance.link,
  'latestReleaseTime': instance.latestReleaseTime,
  'videoNum': instance.videoNum,
  'follow': instance.follow?.toJson(),
  'shield': instance.shield?.toJson(),
  'approvedNotReadyVideoCount': instance.approvedNotReadyVideoCount,
  'ifPgc': instance.ifPgc,
  'recSort': instance.recSort,
  'expert': instance.expert,
};
