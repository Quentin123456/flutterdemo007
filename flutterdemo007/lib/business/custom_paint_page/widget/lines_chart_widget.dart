import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../base/page_widget/common_stateful_widget.dart';
import '../../../utils/log_utils.dart';
import '../painter/horizontal_line_chat_painter.dart';

class LinesChartWidget extends CommonStatefulWidget {
  List<int> dataList;

  LinesChartWidget(this.dataList, {super.key});

  @override
  State<StatefulWidget> createState() {
    return LinesChartState();
  }
}

class LinesChartState extends State<LinesChartWidget> {
  ///手指按下位置
  double tapDownX = 0;

  ///手指横向滚动距离
  double tapDeltaX = 0;

  ///上次滑动横向距离记录
  double lastDeltaX = 0;

  ///横向方向缩放比例
  double horizontalScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CustomPaint(
        size: Size(double.infinity, 400.w),
        painter: HorizontalLineChartPainter(
          widget.dataList,
          tapDeltaX,
          horizontalScale,
          (deltaX) {
            tapDeltaX = deltaX;
            lastDeltaX = tapDeltaX;
          },
        ),
      ),
      onHorizontalDragStart: (details) {},
      onHorizontalDragEnd: (details) {
        lastDeltaX = tapDeltaX;
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          var tempX = lastDeltaX + details.localPosition.dx - tapDownX;
          if (tempX > 0) {
            tempX = 0;
          }
          tapDeltaX = tempX;
        });
      },
      onHorizontalDragCancel: () {},
      onHorizontalDragDown: (details) {
        tapDownX = details.localPosition.dx;
      },
      onScaleStart: (details) {},
      onScaleUpdate: (details) {
        setState(() {
          horizontalScale = details.horizontalScale;
        });

        LogD(
          "监听手指状态放大缩小>>>>>>>>>${details.focalPoint.dx}>>>>>>${details.horizontalScale}",
        );
      },
      onScaleEnd: (details) {},
    );
  }
}
