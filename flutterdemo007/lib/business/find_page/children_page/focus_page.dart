import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../base/controller/base_refresh_controller.dart';
import '../../../base/page_widget/base_stateless_widget.dart';
import '../../../http/api_service/api_service.dart';
import '../../../route/router_utils.dart';
import '../../../widgets/pull_smart_refresher.dart';
import '../model/focus_entity.dart';
import '../model/focus_item_entity.dart';
import '../widget/item_focus_outer_widget.dart';

///关注页面
// ignore: must_be_immutable
class FocusPage extends BaseStatelessWidget<FocusController> {
  String tagType;

  FocusPage({super.key, required this.tagType});

  @override
  String? get tag {
    return tagType;
  }

  @override
  Widget buildContent(BuildContext context) {
    return RefreshWidget<FocusController>(
      controllerTag: tagType,
      refreshController: controller.refreshController,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ItemFocusOuterWidget(controller.dataList[index]);
        },
        itemCount: controller.dataList.length,
      ),
    );
  }

  @override
  bool showTitleBar() {
    return tagType == "route";
  }

  @override
  String titleString() {
    return "关注";
  }

  ///搜索按钮
  @override
  List<Widget>? appBarActionWidget(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          RouterUtils.toSearchPage();
        },
        icon: const Icon(Icons.search),
      ),
    ];
  }
}

class FocusController extends BaseRefreshController<ApiService> {
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
    pageIndex++;
    httpRequest<FocusEntity>(api.queryFocusData(pageIndex), (value) {
      if (refresh == Refresh.first || refresh == Refresh.pull) {
        dataList.clear();
      }
      dataList.addAll(value.itemList ?? []);
      hideRefresh(refreshController);
    });
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

class FocusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FocusController(), tag: "route");
    // Get.lazyPut(() => FocusController(), tag: "focus"); //支持
  }
}
