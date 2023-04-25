// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map json) => _$_Movie(
      uid: json['uid'] as String?,
      youtubeId: json['youtubeId'] as String?,
      imdb: json['imdb'] == null
          ? null
          : Imdb.fromJson(Map<String, dynamic>.from(json['imdb'] as Map)),
      title: json['Title'] as String?,
      year: json['Year'] as String?,
      imdbId: json['imdbID'] as String?,
      type: json['Type'] as String?,
      poster: json['Poster'] as String?,
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'uid': instance.uid,
      'youtubeId': instance.youtubeId,
      'imdb': instance.imdb?.toJson(),
      'Title': instance.title,
      'Year': instance.year,
      'imdbID': instance.imdbId,
      'Type': instance.type,
      'Poster': instance.poster,
    };
