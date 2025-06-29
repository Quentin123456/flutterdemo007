// 1、引入json_annotation.dart
import 'package:json_annotation/json_annotation.dart';
import 'consumption.dart';
import 'provider.dart';
import 'author.dart';
import 'cover.dart';
import 'web_url.dart';
// 2、这里手动输入：data.g.dart文件将在我们运行生成命令后自动生成
part 'data.g.dart';
// 3、这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable(explicitToJson: true)

class Data {
  // 4、定义网络数据json返回属性值
  String? dataType;
  int? id;
  String? title;
  String? description;
  String? library;
  Consumption? consumption;
  String? resourceType;
  Provider? provider;
  String? category;
  Author? author;
  Cover? cover;
  String? playUrl;
  int? duration;
  WebUrl? webUrl;
  int? releaseTime;
  bool? ad;
  String? type;
  String? descriptionPgc;
  String? remark;
  bool? ifLimitVideo;
  int? searchWeight;
  int? idx;
  int? date;
  String? descriptionEditor;
  bool? collected;
  bool? reallyCollected;
  bool? played;
  String? image;

  // 5、必须的方法
  Data(this.dataType, this.id, this.title, this.description, this.library, this.consumption, this.resourceType, this.provider, this.category, this.author, this.cover, this.playUrl, this.duration, this.webUrl, this.releaseTime, this.ad, this.type, this.descriptionPgc, this.remark, this.ifLimitVideo, this.searchWeight, this.idx, this.date, this.descriptionEditor, this.collected, this.reallyCollected, this.played, this.image);
  // 6、必须的代码：代码格式是固定的，将下面的“Data”关键词替换为你定义的model类名称即可
  // 反序列化
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  // 序列化
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
