import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'omdb_api.g.dart';

@RestApi()
abstract class OmdbApi {
  factory OmdbApi(Dio dio, {String baseUrl}) = _OmdbApi;

  @GET("&s={title}&type=movie")
  Future getMovies(@Path() String title);

  @GET("&i={imdbId}&type=movie")
  Future getImdb(@Path() String imdbId);
}
