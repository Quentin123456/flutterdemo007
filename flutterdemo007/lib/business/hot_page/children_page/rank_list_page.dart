import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../base/controller/base_refresh_controller.dart';
import '../../../base/page_widget/base_stateful_widget.dart';
import '../../../http/api_service/api_service.dart';
import '../../../widgets/pull_smart_refresher.dart';
import '../../find_page/model/focus_entity.dart';
import '../../find_page/model/focus_item_entity.dart';
import '../widget/item_rank_widget.dart';

///实际复用场景-热门-排行榜
// ignore: must_be_immutable
class RankListPage extends BaseStatefulWidget<RankListController> {
  String rankType;
  String tagType;

  RankListPage({super.key, required this.rankType, required this.tagType});

  ///动态通过Tag查找Controller-重写tag方法
  @override
  String get tag {
    return "${tagType}_$rankType";
  }

  ///解决动态传参初始化Controller，导致PagerView懒加载失效
  @override
  Widget build(BuildContext context) {
    controller.rankType = rankType;
    return super.build(context);
  }

  @override
  Widget buildContent(BuildContext context) {
    return RefreshWidget<RankListController>(
      controllerTag: tag,
      refreshController: controller.refreshController,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ItemRankWidget(controller.dataList[index]);
        },
        itemCount: controller.dataList.length,
      ),
    );
  }

  @override
  bool showTitleBar() {
    return false;
  }
}

class RankListController extends BaseRefreshController<ApiService> {
  String rankType = "weekly";
  RxList<FocusItemEntity> dataList = <FocusItemEntity>[].obs;

  @override
  void onReady() {
    super.onReady();
    loadNet();
  }

  @override
  void loadNet() {
    requestPageData();
  }

  @override
  void requestPageData({Refresh refresh = Refresh.first}) {
    httpRequest<FocusEntity>(api.queryRankingData(rankType), (value) {
      if (refresh == Refresh.first || refresh == Refresh.pull) {
        dataList.clear();
      }
      var itemList = value.itemList;
      if (itemList != null && itemList.isNotEmpty) {
        dataList.addAll(itemList);
      }
      hideRefresh(refreshController, finishLoadMore: true);
    });
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

class RankListBinding extends Bindings {
  @override
  void dependencies() {
    ///放在首页Tab可不写，写时为了单独页面依赖能实现跳转绑定
    Get.lazyPut(() => RankListController(), tag: "route_weekly");
    Get.lazyPut(() => RankListController(), tag: "route_monthly");
    Get.lazyPut(() => RankListController(), tag: "route_historical");
  }
}
