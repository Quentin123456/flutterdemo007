import 'package:json_annotation/json_annotation.dart';
import 'focus_data_entity.dart';

part 'focus_item_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class FocusItemEntity {
  String? type;
  FocusDataEntity? data;
  int? id;

  FocusItemEntity(this.type, this.data, this.id);

  factory FocusItemEntity.fromJson(Map<String, dynamic> json) =>
      _$FocusItemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FocusItemEntityToJson(this);
}
