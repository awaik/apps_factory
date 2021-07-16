import 'package:apps_factory/app/domain/artist/artist_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'artist_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ArtistDto {
  String name;
  int listeners;
  String mbid;
  String url;
  List<ArtistImage> image;

  ArtistDto({this.name = '', this.listeners = 0, this.mbid = '', this.url = '', this.image = const []});

  factory ArtistDto.fromJson(Map<String, dynamic> json) => _$ArtistDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistDtoToJson(this);
}
