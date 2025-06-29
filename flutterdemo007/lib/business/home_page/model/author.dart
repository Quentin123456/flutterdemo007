// 1、引入json_annotation.dart
import 'package:json_annotation/json_annotation.dart';
import 'follow.dart';
import 'shield.dart';

// 2、这里手动输入：author.g.dart文件将在我们运行生成命令后自动生成
part 'author.g.dart';

// 3、这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable(explicitToJson: true)
class Author {
  // 4、定义网络数据json返回属性值
  int? id;
  String? icon;
  String? name;
  String? description;
  String? link;
  int? latestReleaseTime;
  int? videoNum;
  Follow? follow;
  Shield? shield;
  int? approvedNotReadyVideoCount;
  bool? ifPgc;
  int? recSort;
  bool? expert;

  // 5、必须的方法
  Author(
    this.id,
    this.icon,
    this.name,
    this.description,
    this.link,
    this.latestReleaseTime,
    this.videoNum,
    this.follow,
    this.shield,
    this.approvedNotReadyVideoCount,
    this.ifPgc,
    this.recSort,
    this.expert,
  );

  // 6、必须的代码：代码格式是固定的，将下面的“Author”关键词替换为你定义的model类名称即可
  // 反序列化
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  // 序列化
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
