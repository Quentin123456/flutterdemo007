// 1、引入json_annotation.dart
import 'package:json_annotation/json_annotation.dart';
import 'item_list.dart';

// 2、这里手动输入：issueList.g.dart文件将在我们运行生成命令后自动生成
part 'issue_list.g.dart';

// 3、这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable(explicitToJson: true)
class IssueList {
  // 4、定义网络数据json返回属性值
  int? releaseTime;
  String? type;
  int? date;
  int? publishTime;
  List<ItemList>? itemList;
  int? count;

  // 5、必须的方法
  IssueList(
    this.releaseTime,
    this.type,
    this.date,
    this.publishTime,
    this.itemList,
    this.count,
  );

  // 6、必须的代码：代码格式是固定的，将下面的“IssueList”关键词替换为你定义的model类名称即可
  // 反序列化
  factory IssueList.fromJson(Map<String, dynamic> json) =>
      _$IssueListFromJson(json);

  // 序列化
  Map<String, dynamic> toJson() => _$IssueListToJson(this);
}
