// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map json) => _$_Movie(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      plot: json['plot'] as String?,
      poster: json['poster'] as int?,
      trailer: json['trailer'] as bool?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'plot': instance.plot,
      'poster': instance.poster,
      'trailer': instance.trailer,
      'type': instance.type,
    };
