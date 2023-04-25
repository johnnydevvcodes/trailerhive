

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'imdb.freezed.dart';
part 'imdb.g.dart';

@freezed
class Imdb with _$Imdb {
  const factory Imdb({
    @JsonKey(name: 'Title') String? title,
    @JsonKey(name: 'Year') String? year,
    @JsonKey(name: 'Rated') String? rated,
    @JsonKey(name: 'Released') String? release,
    @JsonKey(name: 'Runtime') String? runtime,
    @JsonKey(name: 'Genre') String? genre,
    @JsonKey(name: 'Director') String? director,
    @JsonKey(name: 'Writer') String? writer,
    @JsonKey(name: 'Actors') String? actor,
    @JsonKey(name: 'Plot') String? plot,
    @JsonKey(name: 'Language') String? language,
    @JsonKey(name: 'Country') String? country,
    @JsonKey(name: 'Awards') String? awards,
    @JsonKey(name: 'Poster') String? poster,
    @JsonKey(name: 'imdbID') String? imdbID,
  }) = _Imdb;
  factory Imdb.fromJson(Map<String, dynamic> json) => _$ImdbFromJson(json);
}

// {
//    "Title":"Guardians of the Galaxy Vol. 2",
//    "Year":"2017",
//    "Rated":"PG-13",
//    "Released":"05 May 2017",
//    "Runtime":"136 min",
//    "Genre":"Action, Adventure, Comedy",
//    "Director":"James Gunn",
//    "Writer":"James Gunn, Dan Abnett, Andy Lanning",
//    "Actors":"Chris Pratt, Zoe Saldana, Dave Bautista",
//    "Plot":"The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord's encounter with his father the ambitious celestial being Ego.",
//    "Language":"English",
//    "Country":"United States",
//    "Awards":"Nominated for 1 Oscar. 15 wins & 60 nominations total",
//    "Poster":"https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg",
//    "Ratings":[
//       {
//          "Source":"Internet Imdb Database",
//          "Value":"7.6/10"
//       },
//       {
//          "Source":"Rotten Tomatoes",
//          "Value":"85%"
//       },
//       {
//          "Source":"Metacritic",
//          "Value":"67/100"
//       }
//    ],
//    "Metascore":"67",
//    "imdbRating":"7.6",
//    "imdbVotes":"699,402",
//    "imdbID":"tt3896198",
//    "Type":"Imdb",
//    "DVD":"22 Aug 2017",
//    "BoxOffice":"$389,813,101",
//    "Production":"N/A",
//    "Website":"N/A",
//    "Response":"True"
// }