// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueList _$IssueListFromJson(Map<String, dynamic> json) => IssueList(
  (json['releaseTime'] as num?)?.toInt(),
  json['type'] as String?,
  (json['date'] as num?)?.toInt(),
  (json['publishTime'] as num?)?.toInt(),
  (json['itemList'] as List<dynamic>?)
      ?.map((e) => ItemList.fromJson(e as Map<String, dynamic>))
      .toList(),
  (json['count'] as num?)?.toInt(),
);

Map<String, dynamic> _$IssueListToJson(IssueList instance) => <String, dynamic>{
  'releaseTime': instance.releaseTime,
  'type': instance.type,
  'date': instance.date,
  'publishTime': instance.publishTime,
  'itemList': instance.itemList?.map((e) => e.toJson()).toList(),
  'count': instance.count,
};
