import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business/custom_paint_page/widget/bar_chart_widget.dart';
import '../../business/custom_paint_page/widget/line_chart_widget.dart';
import '../../business/custom_paint_page/widget/lines_chart_widget.dart';
import 'painter/circle_chart_painter.dart';
import 'painter/radar_chart_painter.dart';
import 'painter/line_chart_painter.dart';
import 'painter/vote_painter.dart';
import 'painter/bar_chart_painter.dart';
import 'package:get/get.dart';
import '../../base/controller/base_controller.dart';
import '../../base/page_widget/base_stateless_widget.dart';
import '../../res/style.dart';
import 'model/radar_view_entity.dart';

class CustomPaintPage extends BaseStatelessWidget<CustomPaintController> {
  const CustomPaintPage({super.key});

  @override
  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("折线图", style: Styles.style_black_32),
          Container(
            padding: EdgeInsets.all(25.w),
            child: LineChartWidget(controller.lineChartList.value),
          ),
          Text("滚动缩放折线图", style: Styles.style_black_32),
          Container(
            padding: EdgeInsets.all(25.w),
            child: LinesChartWidget(controller.linesChartList.value),
          ),
          Text("饼图", style: Styles.style_black_32),
          Container(
            margin: EdgeInsets.only(top: 30.w, bottom: 30.w),
            alignment: Alignment.center,
            child: CustomPaint(
              painter: CircleChartPainter(controller.circleChartList.value),
              size: Size(300.w, 300.w),
            ),
          ),
          Text("柱状图", style: Styles.style_black_32),
          Container(
            padding: EdgeInsets.all(25.w),
            child: BarChartWidget(controller.circleChartList.value),
          ),
          Text("投票控件", style: Styles.style_black_32),
          Container(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: CustomPaint(
              size: Size(double.infinity, 40.w),
              painter: VotePainter(
                controller.posiNum.value,
                controller.pageNum.value,
              ),
            ),
          ),
          Box.hBox30,
          Container(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: CustomPaint(
              size: Size(double.infinity, 40.w),
              painter: VotePainter(
                controller.posiNum1.value,
                controller.pageNum1.value,
              ),
            ),
          ),
          Box.hBox30,
          Container(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 50.w),
            child: CustomPaint(
              size: Size(double.infinity, 40.w),
              painter: VotePainter(
                controller.posiNum2.value,
                controller.pageNum2.value,
              ),
            ),
          ),
          Text("雷达图", style: Styles.style_black_32),
          CustomPaint(
            size: Size(300.w, 300.w),
            painter: RadarChartPainter(controller.radarList.value),
          ),
          Box.hBox20,
          CustomPaint(
            size: Size(300.w, 300.w),
            painter: RadarChartPainter(controller.radarList1.value),
          ),
          Box.hBox20,
          CustomPaint(
            size: Size(300.w, 300.w),
            painter: RadarChartPainter(controller.radarList2.value),
          ),
          Box.hBox20,
          CustomPaint(
            size: Size(300.w, 300.w),
            painter: RadarChartPainter(controller.radarList3.value),
          ),
        ],
      ),
    );
  }

  @override
  String titleString() {
    return "自定义控件";
  }

  @override
  bool useLoadSir() {
    return false;
  }
}

class CustomPaintController extends BaseController {
  RxList<int> lineChartList = <int>[5, 10, 8, 6, 7, 2, 15, 14, 13, 9].obs;
  RxList<int> linesChartList = <int>[
    5,
    10,
    8,
    6,
    7,
    2,
    15,
    14,
    13,
    9,
    5,
    10,
    8,
    6,
    7,
    2,
    15,
    14,
    13,
    9,
    5,
    10,
    8,
    6,
    7,
    2,
    15,
    14,
    13,
    9,
    5,
    10,
    8,
    6,
    7,
    2,
    15,
    14,
    13,
    9,
    5,
    10,
    8,
    6,
    7,
    2,
    15,
    14,
    13,
    9,
  ].obs;
  RxList<double> circleChartList = <double>[
    5,
    10,
    8,
    6,
    7,
    2,
    15,
    14,
    13,
    9,
  ].obs;

  RxList<RadarViewEntity> radarList = <RadarViewEntity>[
    RadarViewEntity("标签标签", 4),
    RadarViewEntity("标签标签", 3),
    RadarViewEntity("标签标签", 6),
    RadarViewEntity("标签标签", 7),
  ].obs;

  RxList<RadarViewEntity> radarList1 = <RadarViewEntity>[
    RadarViewEntity("标签标签", 4),
    RadarViewEntity("标签标签", 3),
    RadarViewEntity("标签标签", 6),
  ].obs;

  RxList<RadarViewEntity> radarList2 = <RadarViewEntity>[
    RadarViewEntity("标签标签", 4),
    RadarViewEntity("标签标签", 3),
    RadarViewEntity("标签标签", 6),
    RadarViewEntity("标签标签", 7),
    RadarViewEntity("标签标签", 9),
    RadarViewEntity("标签标签", 6),
  ].obs;

  RxList<RadarViewEntity> radarList3 = <RadarViewEntity>[
    RadarViewEntity("标签标签", 4),
    RadarViewEntity("标签标签", 3),
    RadarViewEntity("标签标签", 6),
    RadarViewEntity("标签标签", 7),
    RadarViewEntity("标签标签", 9),
  ].obs;

  RxDouble pageNum = 50.0.obs;
  RxDouble posiNum = 110.0.obs;

  RxDouble pageNum1 = 3.0.obs;
  RxDouble posiNum1 = 150.0.obs;

  RxDouble pageNum2 = 150.0.obs;
  RxDouble posiNum2 = 3.0.obs;

  @override
  void loadNet() {}

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

class CustomPaintBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomPaintController());
  }
}
