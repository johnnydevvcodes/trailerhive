// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:trailerhive/app/movie_store.dart' as _i7;
import 'package:trailerhive/core/db/app_db.dart' as _i4;
import 'package:trailerhive/core/db/app_db_interface.dart' as _i3;
import 'package:trailerhive/data/movie/movie_dao.dart' as _i5;
import 'package:trailerhive/data/movie/movie_repo.dart' as _i6;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AppDatabaseApi>(() => _i4.AppDatabase());
  gh.lazySingleton<_i5.MovieDao>(() => _i5.MovieDao());
  gh.lazySingleton<_i6.MovieRepo>(() => _i6.MovieRepo());
  gh.lazySingleton<_i7.MovieStore>(() => _i7.MovieStore());
  return getIt;
}
