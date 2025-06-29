import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../base/page_widget/common_stateless_widget.dart';
import '../../../res/colors.dart';
import '../../../res/style.dart';
import '../../../utils/log_utils.dart';
import '../../../widgets/base_network_image.dart';
import '../model/topic_item_list.dart';

// ignore: must_be_immutable
class ItemTopicDetailWidget extends CommonStatelessWidget {
  TopicItemList itemData;
  int itemIndex; //条目Index
  RxInt playIndex; //正在播放的index
  ValueChanged callback;

  ItemTopicDetailWidget(
      this.itemData, this.itemIndex, this.playIndex, this.callback,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return _createContent(context);
  }

  Widget _createContent(BuildContext? context) {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    return Obx(() => VisibilityDetector(
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction == 0) {
          try {
            var key = visibilityInfo.key as ValueKey;
            if (playIndex.value.toString() == key.value) {
              LogWTF("滚动监听>>>>>>>>>>${playIndex.value.toString()}");
              if (null != context) {
                var isLandscape = context.isLandscape;
                var width = context.width;
                var height = context.height;
                LogD("宽高监听>>>>>>>$width>>>>>>$height");
                if (!isLandscape) {
                  LogWTF("滚动监听竖屏监听》》》》》》》》");
                }
              }
            }
            // ignore: empty_catches
          } catch (e) {
            LogE("滚动控件监听异常>>>>>>>${e.toString()}");
          }
        }
      },
      key: Key(itemIndex.toString()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Box.hBox20,
          Text(
            itemData.data?.content?.data?.title ?? "",
            style:
            TextStyle(fontSize: 26.sp, color: ColorStyle.color_black),
          ),
          Container(
            color: ColorStyle.color_white,
            padding: EdgeInsets.only(
                left: 32.w, right: 32.w, bottom: 15.w, top: 15.w),
            child: Text(
              itemData.data?.content?.data?.description ?? "",
              style: TextStyle(
                  fontSize: 22.sp, color: ColorStyle.color_666666),
            ),
          )
        ],
      ),
    ));
  }
}
