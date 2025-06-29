import 'package:flutter/material.dart';
import '../../mixin/toast/toast_mixin.dart';

///实现一些基础功能的StatelessWidget(例如Toast等)
abstract class CommonStatelessWidget extends StatelessWidget with ToastMixin {
  const CommonStatelessWidget({super.key});
}
