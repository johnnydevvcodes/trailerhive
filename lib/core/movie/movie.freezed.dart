// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return _Movie.fromJson(json);
}

/// @nodoc
mixin _$Movie {
  String? get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'plot')
  String? get plot => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster')
  int? get poster => throw _privateConstructorUsedError;
  @JsonKey(name: 'trailer')
  bool? get trailer => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res, Movie>;
  @useResult
  $Res call(
      {String? uid,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'plot') String? plot,
      @JsonKey(name: 'poster') int? poster,
      @JsonKey(name: 'trailer') bool? trailer,
      @JsonKey(name: 'type') String? type});
}

/// @nodoc
class _$MovieCopyWithImpl<$Res, $Val extends Movie>
    implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? plot = freezed,
    Object? poster = freezed,
    Object? trailer = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      plot: freezed == plot
          ? _value.plot
          : plot // ignore: cast_nullable_to_non_nullable
              as String?,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as int?,
      trailer: freezed == trailer
          ? _value.trailer
          : trailer // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovieCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$$_MovieCopyWith(_$_Movie value, $Res Function(_$_Movie) then) =
      __$$_MovieCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'plot') String? plot,
      @JsonKey(name: 'poster') int? poster,
      @JsonKey(name: 'trailer') bool? trailer,
      @JsonKey(name: 'type') String? type});
}

/// @nodoc
class __$$_MovieCopyWithImpl<$Res> extends _$MovieCopyWithImpl<$Res, _$_Movie>
    implements _$$_MovieCopyWith<$Res> {
  __$$_MovieCopyWithImpl(_$_Movie _value, $Res Function(_$_Movie) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? plot = freezed,
    Object? poster = freezed,
    Object? trailer = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_Movie(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      plot: freezed == plot
          ? _value.plot
          : plot // ignore: cast_nullable_to_non_nullable
              as String?,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as int?,
      trailer: freezed == trailer
          ? _value.trailer
          : trailer // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Movie with DiagnosticableTreeMixin implements _Movie {
  const _$_Movie(
      {this.uid,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'plot') this.plot,
      @JsonKey(name: 'poster') this.poster,
      @JsonKey(name: 'trailer') this.trailer,
      @JsonKey(name: 'type') this.type});

  factory _$_Movie.fromJson(Map<String, dynamic> json) =>
      _$$_MovieFromJson(json);

  @override
  final String? uid;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'plot')
  final String? plot;
  @override
  @JsonKey(name: 'poster')
  final int? poster;
  @override
  @JsonKey(name: 'trailer')
  final bool? trailer;
  @override
  @JsonKey(name: 'type')
  final String? type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Movie(uid: $uid, name: $name, plot: $plot, poster: $poster, trailer: $trailer, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Movie'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('plot', plot))
      ..add(DiagnosticsProperty('poster', poster))
      ..add(DiagnosticsProperty('trailer', trailer))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Movie &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.plot, plot) || other.plot == plot) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.trailer, trailer) || other.trailer == trailer) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, name, plot, poster, trailer, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieCopyWith<_$_Movie> get copyWith =>
      __$$_MovieCopyWithImpl<_$_Movie>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieToJson(
      this,
    );
  }
}

abstract class _Movie implements Movie {
  const factory _Movie(
      {final String? uid,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'plot') final String? plot,
      @JsonKey(name: 'poster') final int? poster,
      @JsonKey(name: 'trailer') final bool? trailer,
      @JsonKey(name: 'type') final String? type}) = _$_Movie;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$_Movie.fromJson;

  @override
  String? get uid;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'plot')
  String? get plot;
  @override
  @JsonKey(name: 'poster')
  int? get poster;
  @override
  @JsonKey(name: 'trailer')
  bool? get trailer;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$_MovieCopyWith<_$_Movie> get copyWith =>
      throw _privateConstructorUsedError;
}
