import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../base/controller/base_refresh_controller.dart';
import '../../base/page_widget/base_stateless_widget.dart';
import '../../http/api_service/api_service.dart';
import '../../widgets/base_network_image.dart';
import '../../widgets/pull_smart_refresher.dart';
import '../find_page/model/focus_entity.dart';
import '../find_page/model/focus_item_entity.dart';
import '../hot_page/widget/item_rank_widget.dart';

///分类详情页面
class TypeDetailPage extends BaseStatelessWidget<TypeDetailController> {
  const TypeDetailPage({super.key});

  @override
  Widget buildContent(BuildContext context) {
    return RefreshWidget<TypeDetailController>(
      child: CustomScrollView(
        slivers: [_createSliverAppBar(), _createSliverList()],
      ),
    );
  }

  ///顶部滚动AppBar
  Widget _createSliverAppBar() {
    return SliverAppBar(
      elevation: 8.0,
      title: Text(controller.typeName),
      pinned: true,
      expandedHeight: 400.w,
      flexibleSpace: FlexibleSpaceBar(
        background: BaseNetworkImage(controller.sliverBg, fit: BoxFit.fill),
      ),
    );
  }

  Widget _createSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return ItemRankWidget(controller.dataList[index]);
      }, childCount: controller.dataList.length),
    );
  }

  @override
  bool showTitleBar() => false;
}

class TypeDetailController extends BaseRefreshController<ApiService> {
  String typeName = Get.parameters["typeName"] ?? "";
  String sliverBg = Get.parameters["headerImg"] ?? "";
  String typeId = Get.parameters["typeId"] ?? "";
  RxList<FocusItemEntity> dataList = <FocusItemEntity>[].obs;
  var pageSize = 10;

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
    httpRequest<FocusEntity>(
      api.queryTypeDetail(typeId, pageIndex * pageSize),
      (value) {
        if (refresh == Refresh.first || refresh == Refresh.pull) {
          dataList.clear();
        }
        var itemList = value.itemList;
        if (itemList != null && itemList.isNotEmpty) {
          dataList.addAll(itemList);
        }
        hideRefresh(refreshController);
      },
    );
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

class TypeDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TypeDetailController());
  }
}
