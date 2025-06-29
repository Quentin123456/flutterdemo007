import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../business/complain/model/feedback_detail_list_entity.dart';
import '../../business/complain/model/my_feedback_entity.dart';
import '../../constant/http_url.dart';
import '../dio_client.dart';
import '../result/base_result.dart';

part 'gateway_api.g.dart';

@RestApi(baseUrl: HttpUrl.BASE_GATEWAY_URL)
abstract class GatewayApi {
  factory GatewayApi({Dio? dio, String? baseUrl}) {
    dio ??= DioClient().dio;
    return _GatewayApi(dio, baseUrl: baseUrl);
  }

  ///添加反馈信息
  @POST("/api/feedback/insertQuestion")
  Future<BaseResult<int>> addFeedBack(@Body() Map<String, dynamic> map);

  ///获取我的反馈列表
  @POST("/api/feedback/myQuestionList")
  Future<BaseResult<List<MyFeedbackEntity>>> queryMyFeedback();

  ///添加反馈信息
  @GET("/api/feedback/details")
  Future<BaseResult<FeedbackDetailListEntity>> feedbackDetails(
    @Query("id") int id,
  );

  ///回复消息接口
  @POST("/api/feedback/insertContent")
  Future<BaseResult> insertAnswer(@Body() Map<String, dynamic> map);
}
