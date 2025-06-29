import 'package:flutter/cupertino.dart';
import 'widget/item_my_feedback_widget.dart';
import 'package:get/get.dart';
import '../../base/controller/base_refresh_controller.dart';
import '../../base/page_widget/base_stateless_widget.dart';
import '../../http/api_service/gateway_api.dart';
import '../../http/result/base_result.dart';
import '../../route/router_utils.dart';
import '../../widgets/pull_smart_refresher.dart';
import 'model/my_feedback_entity.dart';

///我的反馈列表
class ComplainMyListPage extends BaseStatelessWidget<ComplainMyListController> {
  const ComplainMyListPage({super.key});

  @override
  Widget buildContent(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: RefreshWidget<ComplainMyListController>(
          refreshController: controller.refreshController,
          enablePullUp: false,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                child: ItemMyFeedbackWidget(controller.feedbackList[index]),
                onTap: () {
                  RouterUtils.toComplainRecordPage(
                    controller.feedbackList[index].id,
                  );
                },
              );
            },
            itemCount: controller.feedbackList.length,
          ),
        ),
      ),
    );
  }

  @override
  String titleString() => "我的反馈";
}

class ComplainMyListController extends BaseRefreshController<GatewayApi> {
  RxList<MyFeedbackEntity> feedbackList = <MyFeedbackEntity>[].obs;

  @override
  void onReady() {
    super.onReady();
    loadNet();
  }

  @override
  void loadNet() {
    super.loadNet();
    requestPageData();
  }

  @override
  void requestPageData({Refresh refresh = Refresh.first}) {
    httpRequest<BaseResult<List<MyFeedbackEntity>>>(api.queryMyFeedback(), (
      value,
    ) {
      if (refresh == Refresh.first || refresh == Refresh.pull) {
        feedbackList.clear();
      }
      feedbackList.addAll(value.resObject!);
      if (feedbackList.isEmpty) {
        showEmpty();
      }
      hideRefresh(refreshController);
    });
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

///依赖绑定
class ComplainMyListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComplainMyListController());
  }
}
