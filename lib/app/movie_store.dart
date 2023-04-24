import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:trailerhive/data/movie/movie_repo.dart';

import '../../../core/di/service_locator.dart';
import '../core/movie/movie.dart';

part 'movie_store.g.dart';

@lazySingleton
class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
  var _movieRepo = locator<MovieRepo>();

  _MovieStore() {
    _movieRepo.streamMovies().listen((movies) {
      this.movies = movies;
    });
  }

  @observable
  List<Movie> movies = [];

  @action
  Future saveMovie(Movie movie) {
    return _movieRepo.saveMovie(movie);
  }

  @action
  Future unsaveMovie(Movie movie) {
    return _movieRepo.unsaveMovie(movie);
  }

  @action
  void sortBy(String key, bool isAscending) {
    List<Movie> sortedMovies = List.from(this.movies);
    if (sortedMovies.isEmpty) return;
    List objects = sortedMovies.map((e) => e.toJson()).toList();
    if (isAscending) {
      objects.sort((a, b) {
        return a.value[key]
            .toString()
            .toLowerCase()
            .compareTo(b.value[key].toString().toLowerCase());
      });
    } else {
      objects.sort((a, b) {
        return a.value[key]
            .toString()
            .toLowerCase()
            .compareTo(b.value[key].toString().toLowerCase());
      });
    }
    List<Movie> sorted = objects.map((e) => Movie.fromJson(e)).toList();
    this.movies = sorted;
  }
}
