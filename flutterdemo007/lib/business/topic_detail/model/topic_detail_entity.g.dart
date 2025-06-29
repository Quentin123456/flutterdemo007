// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicDetailEntity _$TopicDetailEntityFromJson(Map<String, dynamic> json) =>
    TopicDetailEntity(
      id: (json['id'] as num?)?.toInt(),
      headerImage: json['headerImage'] as String?,
      brief: json['brief'] as String?,
      text: json['text'] as String?,
      shareLink: json['shareLink'] as String?,
      count: (json['count'] as num?)?.toInt(),
      itemList: (json['itemList'] as List<dynamic>?)
          ?.map((e) => TopicItemList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopicDetailEntityToJson(TopicDetailEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'headerImage': instance.headerImage,
      'brief': instance.brief,
      'text': instance.text,
      'shareLink': instance.shareLink,
      'count': instance.count,
      'itemList': instance.itemList?.map((e) => e.toJson()).toList(),
    };
