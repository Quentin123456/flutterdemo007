import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../business/find_page/model/focus_entity.dart';
import '../../business/find_page/model/topic_entity.dart';
import '../../business/find_page/model/type_entity.dart';
import '../../business/home_page/model/feed_entity.dart';
import '../../business/topic_detail/model/topic_detail_entity.dart';
import '../../constant/common_constant.dart';
import '../../constant/http_url.dart';
import '../dio_client.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: HttpUrl.BASE_URL)
abstract class ApiService {
  factory ApiService({Dio? dio, String? baseUrl}) {
    dio ??= DioClient().dio;
    return _ApiService(dio, baseUrl: baseUrl);
  }

  ///获取首页数据
  @GET("api/v2/feed")
  Future<FeedEntity> queryFeedData(
    @Query("date") String date,
    @Query("num") int pageIndex,
  );

  ///获取分类数据
  @GET("api/v4/categories")
  Future<List<TypeEntity>> queryCategoryData();

  ///获取关注数据
  @GET("api/v4/tabs/follow")
  Future<FocusEntity> queryFocusData(@Query("start") int startId);

  ///获取专题数据
  @GET("api/v3/specialTopics")
  Future<TopicEntity> queryTopicData(@Query("start") int startId);

  ///获取排行榜数据  weekly    monthly   historical
  @GET("api/v4/rankList/videos")
  Future<FocusEntity> queryRankingData(@Query("strategy") String strategy);

  ///搜索
  @GET("api/v1/search?&num=10&start=10")
  Future<FocusEntity> searchData(@Query("query") String query);

  ///获取视频详情
  @GET("api/v4/video/related")
  Future<FocusEntity> queryVideoDetail(@Query("id") String videoId);

  ///获取分类详情接口
  @GET("api/v4/categories/videoList")
  Future<FocusEntity> queryTypeDetail(
    @Query("id") String typeId,
    @Query("start") int startNum, {
    @Query("udid") String uuid = CommonConstant.UUID,
    @Query("deviceModel") String deviceModel = CommonConstant.DEVICE_NUM,
  });

  ///查询专题详情
  @GET("api/v3/lightTopics/internal/{id}")
  Future<TopicDetailEntity> queryTopicDetail(@Path("id") String id);
}
