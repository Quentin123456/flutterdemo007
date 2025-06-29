import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../base/controller/base_controller.dart';
import '../../base/page_widget/base_stateless_widget.dart';
import '../../res/colors.dart';
import '../../res/style.dart';

///常见问题展示页面
class ComplainCommonPage extends BaseStatelessWidget<ComplainCommonController> {
  const ComplainCommonPage({super.key});

  @override
  Widget buildContent(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Container(
            height: 88.w,
            padding: EdgeInsets.only(left: 32.w),
            alignment: Alignment.centerLeft,
            child: Text(
              controller.aqTitle.value,
              style: TextStyle(
                fontSize: 32.sp,
                color: ColorStyle.color_333333,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DividerStyle.divider1Half,
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(32.w),
            child: Text(
              controller.aqDesc.value,
              style: TextStyle(fontSize: 28.sp, color: ColorStyle.color_666666),
            ),
          ),
        ],
      ),
    );
  }

  @override
  String titleString() => "常见问题";

  @override
  bool useLoadSir() => false;
}

class ComplainCommonController extends BaseController {
  RxString aqTitle = "".obs; //问题标题
  RxString aqDesc = "".obs; //问题描述

  @override
  void loadNet() {}

  @override
  void onReady() {
    super.onReady();
    aqTitle.value = Get.parameters["aqTitle"] ?? "";
    aqDesc.value = Get.parameters["aqDesc"] ?? "";
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

class ComplainCommonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ComplainCommonController());
  }
}
