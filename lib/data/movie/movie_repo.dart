import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:trailerhive/core/di/service_locator.dart';
import 'package:trailerhive/data/movie/movie_dao.dart';

import '../../core/movie/movie.dart';
import '../service/rest_instance.dart';

@lazySingleton
class MovieRepo {
  var _movieDao = locator<MovieDao>();
  var _omDbclient = Rest.omdbInstance;
  var _ytClient = Rest.youtubeInstance;
  Stream<List<Movie>> streamMovies() {
    final streamController = StreamController<List<Movie>>();
    _movieDao.dbListener().listen((List<RecordSnapshot> rawMovies) {
      List<Movie> movies = [];
      for (var c in rawMovies) {
        try {
          movies.add(Movie.fromJson(c.value));
          // log('dao good Movie: ${c.value.toString()}');
        } catch (err) {
          // log('dao stale Movie: ${c.value.toString()}');
        }
      }
      streamController.add(movies);
    });
    return streamController.stream;
  }

  Future saveMovie(Movie movie) {
    return _movieDao.save(movie.toJson());
  }

  Future unsaveMovie(Movie movie) {
    return _movieDao.remove(movie.toJson());
  }

  Future<List<Movie>> searchMovie(String title) async {
    var data = await _omDbclient.getMovies(title);
    List list = data['Search'];
    if (list.isEmpty) return [];
    var movies = list.map((e) => Movie.fromJson(e)).toList();
    return movies;
  }

  Future getVideo(String title) async {
    var data = await _ytClient.getVideo(title);
    final videoId = data['items'][0]['id']['videoId'];
    return videoId;
  }
}
