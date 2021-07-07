import 'package:json_annotation/json_annotation.dart';
import 'package:movie_list_flutter/models/content.dart';

part 'movie_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieListResponse {
  MovieListResponse(this.title, this.totalContentItems, this.pageNum,
      this.pageSize, this.contentItems);

  String title;

  @JsonKey(name: "total-content-items")
  String totalContentItems;

  @JsonKey(name: "page-num")
  String pageNum;

  @JsonKey(name: "page-size")
  String pageSize;

  @JsonKey(name: "content-items")
  Content contentItems;

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}

