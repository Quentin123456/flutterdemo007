// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedEntity _$FeedEntityFromJson(Map<String, dynamic> json) => FeedEntity(
  (json['issueList'] as List<dynamic>?)
      ?.map((e) => IssueList.fromJson(e as Map<String, dynamic>))
      .toList(),
  json['nextPageUrl'] as String?,
  (json['nextPublishTime'] as num?)?.toInt(),
  json['newestIssueType'] as String?,
  (json['date'] as num?)?.toInt(),
);

Map<String, dynamic> _$FeedEntityToJson(FeedEntity instance) =>
    <String, dynamic>{
      'issueList': instance.issueList?.map((e) => e.toJson()).toList(),
      'nextPageUrl': instance.nextPageUrl,
      'nextPublishTime': instance.nextPublishTime,
      'newestIssueType': instance.newestIssueType,
      'date': instance.date,
    };
