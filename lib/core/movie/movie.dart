import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    String? uid,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'plot') String? plot,
    @JsonKey(name: 'poster') int? poster,
    @JsonKey(name: 'trailer') bool? trailer,
    @JsonKey(name: 'type') String? type,
  }) = _Movie;
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}