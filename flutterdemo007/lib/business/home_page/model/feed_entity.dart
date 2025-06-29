// 1、引入json_annotation.dart
import 'package:json_annotation/json_annotation.dart';
import 'issue_list.dart';

// 2、这里手动输入：feed_entity.g.dart文件将在我们运行生成命令后自动生成
part 'feed_entity.g.dart';

// 3、这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable(explicitToJson: true)
class FeedEntity {
  // 4、定义网络数据json返回属性值
  List<IssueList>? issueList;
  String? nextPageUrl;
  int? nextPublishTime;
  String? newestIssueType;
  int? date;

  // 5、必须的方法
  FeedEntity(
    this.issueList,
    this.nextPageUrl,
    this.nextPublishTime,
    this.newestIssueType,
    this.date,
  );

  // 6、必须的代码：代码格式是固定的，将下面的“FeedEntity”关键词替换为你定义的model类名称即可
  // 反序列化
  factory FeedEntity.fromJson(Map<String, dynamic> json) =>
      _$FeedEntityFromJson(json);

  // 序列化
  Map<String, dynamic> toJson() => _$FeedEntityToJson(this);
}
