import 'dart:async';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:trailerhive/core/di/service_locator.dart';
import 'package:trailerhive/data/movie/movie_dao.dart';

import '../../core/movie/movie.dart';

@lazySingleton
class MovieRepo {
  var _movieDao = locator<MovieDao>();
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
}
