// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FocusItemEntity _$FocusItemEntityFromJson(Map<String, dynamic> json) =>
    FocusItemEntity(
      json['type'] as String?,
      json['data'] == null
          ? null
          : FocusDataEntity.fromJson(json['data'] as Map<String, dynamic>),
      (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FocusItemEntityToJson(FocusItemEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data?.toJson(),
      'id': instance.id,
    };
