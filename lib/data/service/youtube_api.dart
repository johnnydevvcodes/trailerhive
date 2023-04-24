import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'youtube_api.g.dart';

@RestApi()
abstract class YoutubeApi {
  factory YoutubeApi(Dio dio, {String baseUrl}) = _YoutubeApi;

  
  @GET("&part=id,snippet&type=video&q={title}")
  Future getVideo(@Path() String title);

}
