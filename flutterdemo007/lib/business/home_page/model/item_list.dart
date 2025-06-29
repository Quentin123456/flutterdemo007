// 1、引入json_annotation.dart
import 'package:json_annotation/json_annotation.dart';
import 'data.dart';

// 2、这里手动输入：itemList.g.dart文件将在我们运行生成命令后自动生成
part 'item_list.g.dart';

// 3、这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable(explicitToJson: true)
class ItemList {
  // 4、定义网络数据json返回属性值
  String? type;
  Data? data;
  int? id;
  int? adIndex;

  // 5、必须的方法
  ItemList(this.type, this.data, this.id, this.adIndex);

  // 6、必须的代码：代码格式是固定的，将下面的“ItemList”关键词替换为你定义的model类名称即可
  // 反序列化
  factory ItemList.fromJson(Map<String, dynamic> json) =>
      _$ItemListFromJson(json);

  // 序列化
  Map<String, dynamic> toJson() => _$ItemListToJson(this);
}
