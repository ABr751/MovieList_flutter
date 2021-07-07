import 'package:json_annotation/json_annotation.dart';
import 'package:movie_list_flutter/models/movie.dart';

part 'content.g.dart';

@JsonSerializable(explicitToJson: true)
class Content {
  Content(this.content);

  @JsonKey(name: "content")
  List<Movie> content = <Movie>[];

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
