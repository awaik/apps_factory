import 'package:json_annotation/json_annotation.dart';

part 'artist_request_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ArtistRequestDto {
  final String? artist;

  ArtistRequestDto({this.artist});

  factory ArtistRequestDto.fromJson(Map<String, dynamic> json) => _$ArtistRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistRequestDtoToJson(this);
}
