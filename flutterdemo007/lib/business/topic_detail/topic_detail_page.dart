import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business/topic_detail/widget/item_topic_detail_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../base/controller/base_controller.dart';
import '../../base/page_widget/base_stateless_widget.dart';
import '../../http/api_service/api_service.dart';
import '../../res/colors.dart';
import '../../res/style.dart';
import '../../utils/log_utils.dart';
import '../../widgets/base_network_image.dart';
import 'model/topic_detail_entity.dart';
import 'model/topic_item_list.dart';

///专题详情页面
class TopicDetailPage extends BaseStatelessWidget<TopicDetailController> {
  const TopicDetailPage({super.key});

  @override
  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _createHeaderWidget(),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Obx(
                () => ItemTopicDetailWidget(
                  controller.dataList[index],
                  index,
                  controller.playingIndex,
                  (itemHeight) {
                    var height = MediaQuery.of(context).size.height;
                    LogD("Height>>>>>>>>>>>$itemHeight>>>>>>>>>>$height");
                  },
                ),
              );
            },
            itemCount: controller.dataList.length,
          ),
        ],
      ),
    );
  }

  Widget _createHeaderWidget() {
    return Stack(
      children: [
        Column(
          children: [
            BaseNetworkImage(
              controller.headImg.value,
              height: 500.w,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              color: ColorStyle.color_white,
              padding: EdgeInsets.only(
                left: 32.w,
                right: 32.w,
                bottom: 32.w,
                top: 60.w,
              ),
              child: Text(
                controller.headDesc.value,
                style: TextStyle(
                  fontSize: 22.sp,
                  color: ColorStyle.color_666666,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 40.w,
          right: 40.w,
          top: 460.w,
          child: Container(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            alignment: Alignment.center,
            height: 80.w,
            width: 0.8.sw,
            decoration: BoxDecoration(
              color: ColorStyle.color_white,
              border: Border.all(width: 1.w, color: ColorStyle.color_999999),
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
            ),
            child: Text(
              controller.headBrief.value + controller.headBrief.value,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontSize: 28.sp, color: ColorStyle.color_333333),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget? titleWidget() {
    return Obx(
      () => Text(controller.title.value, style: Styles.style_white_32_bold),
    );
  }
}

class TopicDetailController extends BaseController<ApiService> {
  RxInt playingIndex = (-1).obs;
  String id = Get.parameters["id"] ?? "";
  RxString title = "".obs;
  RxString headImg = "".obs;
  RxString headBrief = "".obs;
  RxString headDesc = "".obs;
  RxList<TopicItemList> dataList = <TopicItemList>[].obs;

  @override
  void onReady() {
    super.onReady();
    loadNet();
  }

  void _playerStateChanged() {}

  @override
  void loadNet() {
    queryTopicDetailData();
  }

  void queryTopicDetailData() {
    httpRequest<TopicDetailEntity>(api.queryTopicDetail(id), (value) {
      dataList.addAll(value.itemList ?? []);
      barTitleString.value = value.brief ?? "";
      headBrief.value = value.brief ?? "";
      headImg.value = value.headerImage ?? "";
      headDesc.value = value.text ?? "";
      title.value = value.brief ?? "";
    });
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

class TopicDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopicDetailController());
  }
}
