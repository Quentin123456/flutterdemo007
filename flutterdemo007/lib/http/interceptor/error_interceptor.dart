import 'package:dio/dio.dart';
import '../../utils/log_utils.dart';
import '../app_except.dart';

///错误处理拦截器
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException exception, ErrorInterceptorHandler handler) {
    // error统一处理
    AppException appException = AppException.create(exception);
    // 错误提示
    LogE('DioError===: ${appException.toString()}');
    //exception.error = appException;
    super.onError(exception, handler);
  }
}
