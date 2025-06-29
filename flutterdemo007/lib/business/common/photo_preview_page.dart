import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import '../../base/controller/base_controller.dart';
import '../../base/page_widget/base_stateless_widget.dart';
import '../../res/colors.dart';

///图片预览页面
class PhotoPreviewPage extends BaseStatelessWidget<PhotoPreviewController> {
  const PhotoPreviewPage({super.key});

  @override
  Widget buildContent(BuildContext context) {
    return Obx(
      () => Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        color: ColorStyle.color_black,
        child: GestureDetector(
          child: _createImageProvider(),
          onTap: () {
            Get.back();
          },
        ),
      ),
    );
  }

  Widget _createImageProvider() {
    if (controller.imageUrl.value.isNotEmpty) {
      return Obx(
        () => PhotoView(
          imageProvider: CachedNetworkImageProvider(controller.imageUrl.value),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  bool useLoadSir() => false;

  @override
  bool showTitleBar() => false;
}

///页面控制器
class PhotoPreviewController extends BaseController {
  ///单张图片
  RxString imageUrl = "".obs;

  ///多张图片列表
  RxList<String> imageUrlList = <String>[].obs;

  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    imageUrl.value = Get.arguments;
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

///依赖绑定数据类
class PhotoPreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhotoPreviewController());
  }
}
