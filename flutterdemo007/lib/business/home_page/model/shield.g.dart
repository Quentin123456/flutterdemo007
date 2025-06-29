// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shield.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shield _$ShieldFromJson(Map<String, dynamic> json) => Shield(
  json['itemType'] as String?,
  (json['itemId'] as num?)?.toInt(),
  json['shielded'] as bool?,
);

Map<String, dynamic> _$ShieldToJson(Shield instance) => <String, dynamic>{
  'itemType': instance.itemType,
  'itemId': instance.itemId,
  'shielded': instance.shielded,
};
