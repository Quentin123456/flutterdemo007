// 1、引入json_annotation.dart
import 'package:json_annotation/json_annotation.dart';

// 2、这里手动输入：follow.g.dart文件将在我们运行生成命令后自动生成
part 'follow.g.dart';

// 3、这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class Follow {
  // 4、定义网络数据json返回属性值
  String? itemType;
  int? itemId;
  bool? followed;

  // 5、必须的方法
  Follow(this.itemType, this.itemId, this.followed);

  // 6、必须的代码：代码格式是固定的，将下面的“Follow”关键词替换为你定义的model类名称即可
  // 反序列化
  factory Follow.fromJson(Map<String, dynamic> json) => _$FollowFromJson(json);

  // 序列化
  Map<String, dynamic> toJson() => _$FollowToJson(this);
}
