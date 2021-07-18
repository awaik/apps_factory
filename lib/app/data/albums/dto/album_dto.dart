import 'package:apps_factory/app/data/artists/dto/artist_dto.dart';
import 'package:apps_factory/app/domain/api_image/api_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class AlbumDto {
  final String name;
  @JsonKey(defaultValue: 0)
  final int playcount;
  @JsonKey(defaultValue: '')
  final String mbid;
  @JsonKey(defaultValue: '')
  final String url;
  final List<ApiImage> image;
  final ArtistDto artist;

  AlbumDto(
      {this.name = '',
      this.playcount = 0,
      this.mbid = '',
      this.url = '',
      this.image = const [],
      required this.artist});

  factory AlbumDto.fromJson(Map<String, dynamic> json) =>
      _$AlbumDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumDtoToJson(this);
}
