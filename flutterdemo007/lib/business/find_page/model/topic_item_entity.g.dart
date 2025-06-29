// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicItemEntity _$TopicItemEntityFromJson(Map<String, dynamic> json) =>
    TopicItemEntity(
      json['title'] as String?,
      (json['id'] as num?)?.toInt(),
      json['image'] as String?,
    );

Map<String, dynamic> _$TopicItemEntityToJson(TopicItemEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'image': instance.image,
    };
