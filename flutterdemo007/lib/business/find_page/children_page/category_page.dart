import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../base/controller/base_controller.dart';
import '../../../base/page_widget/base_stateless_widget.dart';
import '../../../http/api_service/api_service.dart';
import '../../../route/router_utils.dart';
import '../../../route/routes.dart';
import '../model/type_entity.dart';
import '../widget/item_category_widget.dart';

///分类页面
// ignore: must_be_immutable
class CategoryPage extends BaseStatelessWidget<CategoryController> {
  String tagType;

  CategoryPage({super.key, required this.tagType});

  @override
  String? get tag {
    return tagType;
  }

  @override
  Widget buildContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 6.w, right: 6.w),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //每行三列
          childAspectRatio: 1.0, //显示区域宽高相等
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ItemCategoryWidget(controller.dataList[index]),
            onTap: () {
              var itemData = controller.dataList[index];
              Map<String, String> map = {};
              map["headerImg"] = itemData.headerImage ?? "";
              map["typeName"] = itemData.name ?? "";
              map["typeId"] = "${itemData.id}";
              Get.toNamed(AppRoutes.typeDetailPage, parameters: map);
            },
          );
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
    return "分类";
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

class CategoryController extends BaseController<ApiService> {
  RxList<TypeEntity> dataList = <TypeEntity>[].obs;

  @override
  void onReady() {
    super.onReady();
    loadNet();
  }

  @override
  void loadNet() {
    queryCategoryData();
  }

  void queryCategoryData() {
    httpRequest<List<TypeEntity>>(api.queryCategoryData(), (value) {
      if (value.isNotEmpty) {
        dataList.addAll(value);
      }
    });
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(() => CategoryController(), tag: "type", permanent: true);
    Get.lazyPut(() => CategoryController(), tag: "route");
  }
}
