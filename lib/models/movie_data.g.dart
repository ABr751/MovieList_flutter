// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieData _$MovieDataFromJson(Map<String, dynamic> json) {
  return MovieData(
    MovieListResponse.fromJson(json['page'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MovieDataToJson(MovieData instance) => <String, dynamic>{
      'page': instance.page.toJson(),
    };
