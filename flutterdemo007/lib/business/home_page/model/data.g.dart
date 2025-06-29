// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  json['dataType'] as String?,
  (json['id'] as num?)?.toInt(),
  json['title'] as String?,
  json['description'] as String?,
  json['library'] as String?,
  json['consumption'] == null
      ? null
      : Consumption.fromJson(json['consumption'] as Map<String, dynamic>),
  json['resourceType'] as String?,
  json['provider'] == null
      ? null
      : Provider.fromJson(json['provider'] as Map<String, dynamic>),
  json['category'] as String?,
  json['author'] == null
      ? null
      : Author.fromJson(json['author'] as Map<String, dynamic>),
  json['cover'] == null
      ? null
      : Cover.fromJson(json['cover'] as Map<String, dynamic>),
  json['playUrl'] as String?,
  (json['duration'] as num?)?.toInt(),
  json['webUrl'] == null
      ? null
      : WebUrl.fromJson(json['webUrl'] as Map<String, dynamic>),
  (json['releaseTime'] as num?)?.toInt(),
  json['ad'] as bool?,
  json['type'] as String?,
  json['descriptionPgc'] as String?,
  json['remark'] as String?,
  json['ifLimitVideo'] as bool?,
  (json['searchWeight'] as num?)?.toInt(),
  (json['idx'] as num?)?.toInt(),
  (json['date'] as num?)?.toInt(),
  json['descriptionEditor'] as String?,
  json['collected'] as bool?,
  json['reallyCollected'] as bool?,
  json['played'] as bool?,
  json['image'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'dataType': instance.dataType,
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'library': instance.library,
  'consumption': instance.consumption?.toJson(),
  'resourceType': instance.resourceType,
  'provider': instance.provider?.toJson(),
  'category': instance.category,
  'author': instance.author?.toJson(),
  'cover': instance.cover?.toJson(),
  'playUrl': instance.playUrl,
  'duration': instance.duration,
  'webUrl': instance.webUrl?.toJson(),
  'releaseTime': instance.releaseTime,
  'ad': instance.ad,
  'type': instance.type,
  'descriptionPgc': instance.descriptionPgc,
  'remark': instance.remark,
  'ifLimitVideo': instance.ifLimitVideo,
  'searchWeight': instance.searchWeight,
  'idx': instance.idx,
  'date': instance.date,
  'descriptionEditor': instance.descriptionEditor,
  'collected': instance.collected,
  'reallyCollected': instance.reallyCollected,
  'played': instance.played,
  'image': instance.image,
};
