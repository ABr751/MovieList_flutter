
import 'package:json_annotation/json_annotation.dart';
import 'movie_list_response.dart';

part 'movie_data.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieData {
  MovieData(this.page);

  MovieListResponse page;

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);

  Map<String, dynamic> toJson(String json) => _$MovieDataToJson(this);
}
