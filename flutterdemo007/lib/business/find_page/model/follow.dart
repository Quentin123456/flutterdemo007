import 'package:json_annotation/json_annotation.dart';

part 'follow.g.dart';

@JsonSerializable()
class Follow {
  Follow({this.itemType, this.itemId, this.followed});

  String? itemType;
  int? itemId;
  bool? followed;

  factory Follow.fromJson(Map<String, dynamic> json) => _$FollowFromJson(json);

  Map<String, dynamic> toJson() => _$FollowToJson(this);
}
