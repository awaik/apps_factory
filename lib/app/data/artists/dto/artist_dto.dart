import 'package:apps_factory/app/domain/api_image/api_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'artist_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ArtistDto {
  String name;
  @JsonKey(defaultValue: '0')
  String listeners;
  @JsonKey(defaultValue: '')
  String mbid;
  String url;
  @JsonKey(defaultValue: [])
  List<ApiImage> image;

  ArtistDto(
      {this.name = '',
      this.listeners = '',
      this.mbid = '',
      this.url = '',
      this.image = const []});

  factory ArtistDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistDtoToJson(this);
}
