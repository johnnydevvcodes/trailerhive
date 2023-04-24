// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore on _MovieStore, Store {
  late final _$moviesAtom = Atom(name: '_MovieStore.movies', context: context);

  @override
  List<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(List<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$searchedMoviesAtom =
      Atom(name: '_MovieStore.searchedMovies', context: context);

  @override
  List<Movie> get searchedMovies {
    _$searchedMoviesAtom.reportRead();
    return super.searchedMovies;
  }

  @override
  set searchedMovies(List<Movie> value) {
    _$searchedMoviesAtom.reportWrite(value, super.searchedMovies, () {
      super.searchedMovies = value;
    });
  }

  late final _$searchMovieAsyncAction =
      AsyncAction('_MovieStore.searchMovie', context: context);

  @override
  Future<dynamic> searchMovie(String title) {
    return _$searchMovieAsyncAction.run(() => super.searchMovie(title));
  }

  late final _$getVideoIdAsyncAction =
      AsyncAction('_MovieStore.getVideoId', context: context);

  @override
  Future<String> getVideoId(String qualifiedTitle) {
    return _$getVideoIdAsyncAction.run(() => super.getVideoId(qualifiedTitle));
  }

  late final _$_MovieStoreActionController =
      ActionController(name: '_MovieStore', context: context);

  @override
  Future<dynamic> saveMovie(Movie movie) {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.saveMovie');
    try {
      return super.saveMovie(movie);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> unsaveMovie(Movie movie) {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.unsaveMovie');
    try {
      return super.unsaveMovie(movie);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sortBy(String key, bool isAscending) {
    final _$actionInfo =
        _$_MovieStoreActionController.startAction(name: '_MovieStore.sortBy');
    try {
      return super.sortBy(key, isAscending);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
searchedMovies: ${searchedMovies}
    ''';
  }
}
