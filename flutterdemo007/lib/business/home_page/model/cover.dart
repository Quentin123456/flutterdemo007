// 1、引入json_annotation.dart
import 'package:json_annotation/json_annotation.dart';

// 2、这里手动输入：cover.g.dart文件将在我们运行生成命令后自动生成
part 'cover.g.dart';

// 3、这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class Cover {
  // 4、定义网络数据json返回属性值
  String? feed;
  String? detail;
  String? blurred;
  String? homepage;

  // 5、必须的方法
  Cover(this.feed, this.detail, this.blurred, this.homepage);

  // 6、必须的代码：代码格式是固定的，将下面的“Cover”关键词替换为你定义的model类名称即可
  // 反序列化
  factory Cover.fromJson(Map<String, dynamic> json) => _$CoverFromJson(json);

  // 序列化
  Map<String, dynamic> toJson() => _$CoverToJson(this);
}
