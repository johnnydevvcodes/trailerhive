import 'dart:async';
import 'dart:developer';

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
  Timer? _timer;

  _MovieStore() {
    if (recoMovies.isEmpty) {
      _movieRepo.loadRecoMovies();
    }

    _movieRepo.streamSavedMovies().listen((movies) {
      this.savedMovies = movies;
    });

    _movieRepo.streamRecoMovies().listen((movies) {
      this.recoMovies = movies;
    });
  }

  @observable
  List<Movie> savedMovies = [];

  @observable
  List<Movie> recoMovies = [];

  @observable
  List<Movie> searchedMovies = [];

  @observable
  bool isSearching = false;

  @action
  void searchMovie(String title) {
    this.isSearching = title.isNotEmpty;
    this.searchedMovies = [];
    _timer?.cancel();
    _timer = Timer(Duration(seconds: 3), () async {
      if (title.isEmpty) return;
      var searchedMovies = await _movieRepo.searchMovie(title);
      this.searchedMovies = searchedMovies;
      this.isSearching = false;
    });
  }

  @action
  Future<String> getVideoId(String qualifiedTitle) async {
    var vidId = await _movieRepo.getVideo(qualifiedTitle);
    log("store video: $vidId");
    return vidId;
  }

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
    List<Movie> sortedMovies = List.from(this.savedMovies);
    if (sortedMovies.isEmpty) return;
    List objects = sortedMovies.map((e) => e.toJson()).toList();
    for (var m in objects) log('not sorted: ${m['Title']}');
    
    if (isAscending) {
      objects.sort((a, b) {
        if (a[key] == null && b[key] == null) {
          return 0;
        } else if (a[key] == null) {
          return 1;
        } else if (b[key] == null) {
          return -1;
        } else {
          return a[key].compareTo(b[key]);
        }
      });
      // objects.sort((a, b) {
      //   return a[key]
      //       .toString()
      //       .toLowerCase()
      //       .compareTo(b[key].toString().toLowerCase());
      // });
    } else {
      objects.sort((a, b) => b[key].compareTo(a[key]));

      // objects.sort((a, b) {
      //   return a[key]
      //       .toString()
      //       .toLowerCase()
      //       .compareTo(b[key].toString().toLowerCase());
      // });
    }
    for (var m in objects) log('sort: ${m['Title']}');
    List<Movie> sorted = objects.map((e) => Movie.fromJson(e)).toList();
    this.savedMovies = sorted;
  }
}
