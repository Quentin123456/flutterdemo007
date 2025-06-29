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
  json['image'] as String?,
  json['actionUrl'] as String?,
  json['shade'] as bool?,
  json['label'] == null
      ? null
      : Label.fromJson(json['label'] as Map<String, dynamic>),
  json['autoPlay'] as bool?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'dataType': instance.dataType,
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'image': instance.image,
  'actionUrl': instance.actionUrl,
  'shade': instance.shade,
  'label': instance.label?.toJson(),
  'autoPlay': instance.autoPlay,
};
