import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../http/api_service/api_service.dart';
import '../http/api_service/common_api.dart';
import '../http/api_service/gateway_api.dart';

///初始化注入对象
class Injection extends GetxService {
  Future<void> init() async {
    await Get.putAsync(() => SharedPreferences.getInstance());
    Get.lazyPut(() => ApiService(), fenix: true);
    Get.lazyPut(() => GatewayApi(), fenix: true);
    Get.lazyPut(() => CommonApi(), fenix: true);
    Get.lazyPut(() => EventBus(), fenix: true);
  }
}
