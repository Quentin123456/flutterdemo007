// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemList _$ItemListFromJson(Map<String, dynamic> json) => ItemList(
  json['type'] as String?,
  json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
  (json['id'] as num?)?.toInt(),
  (json['adIndex'] as num?)?.toInt(),
);

Map<String, dynamic> _$ItemListToJson(ItemList instance) => <String, dynamic>{
  'type': instance.type,
  'data': instance.data?.toJson(),
  'id': instance.id,
  'adIndex': instance.adIndex,
};
