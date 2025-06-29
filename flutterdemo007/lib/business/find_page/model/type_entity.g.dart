// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeEntity _$TypeEntityFromJson(Map<String, dynamic> json) => TypeEntity(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  alias: json['alias'],
  description: json['description'] as String?,
  bgPicture: json['bgPicture'] as String?,
  bgColor: json['bgColor'] as String?,
  headerImage: json['headerImage'] as String?,
  defaultAuthorId: (json['defaultAuthorId'] as num?)?.toInt(),
  tagId: (json['tagId'] as num?)?.toInt(),
);

Map<String, dynamic> _$TypeEntityToJson(TypeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alias': instance.alias,
      'description': instance.description,
      'bgPicture': instance.bgPicture,
      'bgColor': instance.bgColor,
      'headerImage': instance.headerImage,
      'defaultAuthorId': instance.defaultAuthorId,
      'tagId': instance.tagId,
    };
