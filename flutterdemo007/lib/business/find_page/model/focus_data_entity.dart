import 'package:json_annotation/json_annotation.dart';
import '../../home_page/model/author.dart';
import '../../home_page/model/cover.dart';
import '../../home_page/model/item_list.dart';
import 'header_entity.dart';

part 'focus_data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class FocusDataEntity {
  HeaderEntity? header;
  List<ItemList>? itemList;
  String? dataType;
  Cover? cover;
  Author? author;
  String? category;
  String? title;
  String? description;
  String? playUrl;
  int? id;
  ItemList? content;

  FocusDataEntity(
    this.header,
    this.itemList,
    this.dataType,
    this.cover,
    this.author,
    this.category,
    this.title,
    this.description,
    this.playUrl,
    this.id,
    this.content,
  );

  factory FocusDataEntity.fromJson(Map<String, dynamic> json) =>
      _$FocusDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FocusDataEntityToJson(this);
}
