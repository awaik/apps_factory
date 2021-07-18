// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackDto _$TrackDtoFromJson(Map<String, dynamic> json) {
  return TrackDto(
    name: json['name'] as String,
    url: json['url'] as String? ?? '',
    rank: json['rank'] as int? ?? 0,
    duration: json['duration'] as int? ?? 0,
    artist: ArtistDto.fromJson(json['artist'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TrackDtoToJson(TrackDto instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'rank': instance.rank,
      'duration': instance.duration,
      'artist': instance.artist.toJson(),
    };
