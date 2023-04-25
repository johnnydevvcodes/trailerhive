// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore on _MovieStore, Store {
  late final _$savedMoviesAtom =
      Atom(name: '_MovieStore.savedMovies', context: context);

  @override
  List<Movie> get savedMovies {
    _$savedMoviesAtom.reportRead();
    return super.savedMovies;
  }

  @override
  set savedMovies(List<Movie> value) {
    _$savedMoviesAtom.reportWrite(value, super.savedMovies, () {
      super.savedMovies = value;
    });
  }

  late final _$recoMoviesAtom =
      Atom(name: '_MovieStore.recoMovies', context: context);

  @override
  List<Movie> get recoMovies {
    _$recoMoviesAtom.reportRead();
    return super.recoMovies;
  }

  @override
  set recoMovies(List<Movie> value) {
    _$recoMoviesAtom.reportWrite(value, super.recoMovies, () {
      super.recoMovies = value;
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

  late final _$isSearchingAtom =
      Atom(name: '_MovieStore.isSearching', context: context);

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
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
  void searchMovie(String title) {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.searchMovie');
    try {
      return super.searchMovie(title);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

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
savedMovies: ${savedMovies},
recoMovies: ${recoMovies},
searchedMovies: ${searchedMovies},
isSearching: ${isSearching}
    ''';
  }
}
