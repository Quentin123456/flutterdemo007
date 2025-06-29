import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../../business/home_page/widget/item_home_widget.dart';
import 'package:get/get.dart';
import 'package:keframe/keframe.dart';
import '../../base/controller/base_refresh_controller.dart';
import '../../base/page_widget/base_stateful_widget.dart';
import '../../http/api_service/api_service.dart';
import '../../route/router_utils.dart';
import '../../utils/log_utils.dart';
import '../../widgets/pull_smart_refresher.dart';
import '../home_page/model/item_list.dart';
import 'model/feed_entity.dart';

class HomePage extends BaseStatefulWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget buildContent(BuildContext context) {
    return SizedBox(
      child: SizeCacheWidget(
        child: RefreshWidget<HomeController>(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ItemHomeWidget(
                controller.dataList[index],
                index,
                controller.swiperController,
              );
            },
            itemCount: controller.dataList.length,
          ),
        ),
      ),
    );
  }

  @override
  String titleString() => "首页";

  @override
  bool showBackButton() => false;

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

class HomeController extends BaseRefreshController<ApiService> {
  RxList<ItemList> dataList = <ItemList>[].obs;
  SwiperController swiperController = SwiperController();
  String date = "";

  @override
  void loadNet() {
    requestPageData();
  }

  @override
  void onReady() {
    super.onReady();
    LogD("Home初始化onResume");
    loadNet();
  }

  @override
  void requestPageData({Refresh refresh = Refresh.first}) {
    if (refresh == Refresh.first || refresh == Refresh.pull) {
      date = "";
    }
    httpRequest<FeedEntity>(api.queryFeedData(date, 1), (value) {
      var nextPageUrl = value.nextPageUrl ?? "";
      var split = nextPageUrl.split("?");
      var split2 = split[1];
      var split3 = split2.split("&");
      var split4 = split3[0].split("=");
      date = split4[1];
      if (refresh == Refresh.first || refresh == Refresh.pull) {
        dataList.clear();
      }
      dataList.addAll(value.issueList![0].itemList ?? []);
      hideRefresh(refreshController);
    });
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
