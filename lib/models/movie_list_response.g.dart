// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResponse _$MovieListResponseFromJson(Map<String, dynamic> json) {
  return MovieListResponse(
    json['title'] as String,
    json['total-content-items'] as String,
    json['page-num'] as String,
    json['page-size'] as String,
    Content.fromJson(json['content-items'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MovieListResponseToJson(MovieListResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'total-content-items': instance.totalContentItems,
      'page-num': instance.pageNum,
      'page-size': instance.pageSize,
      'content-items': instance.contentItems.toJson(),
    };
