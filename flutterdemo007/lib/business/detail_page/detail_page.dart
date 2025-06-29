import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/video_list_component.dart';
import 'package:get/get.dart';
import '../../base/controller/base_controller.dart';
import '../../base/page_widget/base_stateless_widget.dart';
import '../../http/api_service/api_service.dart';
import '../../res/colors.dart';
import '../../widgets/base_network_image.dart';

///视频详情页面
// ignore: must_be_immutable
class DetailPage extends BaseStatelessWidget<DetailController> {
  const DetailPage({super.key});

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).padding.top,
          color: ColorStyle.color_black,
        ),
        Container(
          height: 450.w,
          color: ColorStyle.color_black,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                child: Hero(
                  tag: controller.videoId,
                  child: BaseNetworkImage(
                    controller.coverUrl.value,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool showTitleBar() {
    return false;
  }

  @override
  bool useLoadSir() => false;
}

class DetailController extends BaseController<ApiService> {
  String? playUrl = Get.parameters["playUrl"];
  String videoId = Get.parameters["videoId"] ?? ""; //视频ID
  RxString coverUrl = (Get.parameters["coverUrl"] ?? "").obs;
  RxString title = (Get.parameters["title"] ?? "").obs;

  ///迁移到BaseComponent实现
  // RxList<FocusItemEntity> dataList = <FocusItemEntity>[].obs;
  // RxInt selectIndex = (-1).obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void loadNet() {
    // queryVideoDetail();
  }

  // void queryVideoDetail() {
  //   httpRequest<FocusEntity>(api.queryVideoDetail(videoId), (value) {
  //     var itemList = value.itemList ?? [];
  //     var tempList = <FocusItemEntity>[];
  //     for (var element in itemList) {
  //       if ((element.type ?? "") == "videoSmallCard") {
  //         tempList.add(element);
  //       }
  //     }
  //     dataList.addAll(tempList);
  //   });
  // }


  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());

    ///注入BaseCompose控制器
    Get.lazyPut(() => VideoListController());
  }
}
