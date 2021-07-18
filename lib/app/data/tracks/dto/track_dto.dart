import 'package:apps_factory/app/data/artists/dto/artist_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class TrackDto {
  final String name;
  @JsonKey(defaultValue: '')
  final String url;
  @JsonKey(defaultValue: 0)
  final int rank;
  @JsonKey(defaultValue: 0)
  final int duration;
  final ArtistDto artist;

  TrackDto(
      {this.name = '',
      this.url = '',
      this.rank = 0,
      this.duration = 0,
      required this.artist});

  factory TrackDto.fromJson(Map<String, dynamic> json) =>
      _$TrackDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TrackDtoToJson(this);
}
