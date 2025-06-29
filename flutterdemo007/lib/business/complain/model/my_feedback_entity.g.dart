// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_feedback_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyFeedbackEntity _$MyFeedbackEntityFromJson(Map<String, dynamic> json) =>
    MyFeedbackEntity(
      id: (json['id'] as num?)?.toInt(),
      type: (json['type'] as num?)?.toInt(),
      content: json['content'] as String?,
      contentType: (json['contentType'] as num?)?.toInt(),
      questionTime: json['questionTime'] as String?,
    );

Map<String, dynamic> _$MyFeedbackEntityToJson(MyFeedbackEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'content': instance.content,
      'contentType': instance.contentType,
      'questionTime': instance.questionTime,
    };
