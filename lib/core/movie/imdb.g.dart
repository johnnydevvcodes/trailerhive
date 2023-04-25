// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imdb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Imdb _$$_ImdbFromJson(Map json) => _$_Imdb(
      title: json['Title'] as String?,
      year: json['Year'] as String?,
      rated: json['Rated'] as String?,
      release: json['Released'] as String?,
      runtime: json['Runtime'] as String?,
      genre: json['Genre'] as String?,
      director: json['Director'] as String?,
      writer: json['Writer'] as String?,
      actor: json['Actors'] as String?,
      plot: json['Plot'] as String?,
      language: json['Language'] as String?,
      country: json['Country'] as String?,
      awards: json['Awards'] as String?,
      poster: json['Poster'] as String?,
      imdbID: json['imdbID'] as String?,
    );

Map<String, dynamic> _$$_ImdbToJson(_$_Imdb instance) => <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'Rated': instance.rated,
      'Released': instance.release,
      'Runtime': instance.runtime,
      'Genre': instance.genre,
      'Director': instance.director,
      'Writer': instance.writer,
      'Actors': instance.actor,
      'Plot': instance.plot,
      'Language': instance.language,
      'Country': instance.country,
      'Awards': instance.awards,
      'Poster': instance.poster,
      'imdbID': instance.imdbID,
    };
