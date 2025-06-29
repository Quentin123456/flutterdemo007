import 'package:dio/dio.dart';
import '../utils/log_utils.dart';

////自定义异常
class AppException implements Exception {
  final String? message;
  final int? code;

  AppException([this.code, this.message]);

  @override
  String toString() {
    return "$code$message";
  }

  factory AppException.create(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.cancel:
        {
          return BadRequestException(-1, "请求取消");
        }
      case DioExceptionType.connectionTimeout:
        {
          return BadRequestException(-1, "连接超时");
        }
      case DioExceptionType.sendTimeout:
        {
          return BadRequestException(-1, "请求超时");
        }
      case DioExceptionType.receiveTimeout:
        {
          return BadRequestException(-1, "响应超时");
        }
      case DioExceptionType.badResponse:
        {
          try {
            int? statusCode = exception.response?.statusCode;
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (statusCode) {
              case 400:
                {
                  return BadRequestException(statusCode, "请求语法错误");
                }
              case 401:
                {
                  return UnauthorisedException(statusCode, "没有权限");
                }
              case 403:
                {
                  return UnauthorisedException(statusCode, "服务器拒绝执行");
                }
              case 404:
                {
                  return UnauthorisedException(statusCode, "无法连接服务器");
                }
              case 405:
                {
                  return UnauthorisedException(statusCode, "请求方法被禁止");
                }
              case 500:
                {
                  return UnauthorisedException(statusCode, "服务器内部错误");
                }

              case 502:
                {
                  return UnauthorisedException(statusCode, "无效的请求");
                }

              case 503:
                {
                  return UnauthorisedException(statusCode, "服务器挂了");
                }

              case 505:
                {
                  return UnauthorisedException(statusCode, "不支持HTTP协议请求");
                }

              default:
                {
                  // return ErrorEntity(code: errCode, message: "未知错误");
                  LogW(exception.response?.statusMessage ?? "");
                  return AppException(
                    statusCode,
                    exception.response?.statusMessage,
                  );
                }
            }
          } on Exception catch (_) {
            return AppException(-1, "未知错误");
          }
        }

      default:
        {
          return AppException(-1, "网络连接异常");
          // return AppException(-1, error.message);
        }
    }
  }
}

/// 请求错误
class BadRequestException extends AppException {
  BadRequestException([super.code, super.message]);
}

/// 未认证异常
class UnauthorisedException extends AppException {
  UnauthorisedException([super.code, super.message]);
}
