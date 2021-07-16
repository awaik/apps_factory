// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistDto _$ArtistDtoFromJson(Map<String, dynamic> json) {
  return ArtistDto(
    name: json['name'] as String,
    listeners: json['listeners'] as String,
    mbid: json['mbid'] as String,
    url: json['url'] as String,
    image: (json['image'] as List<dynamic>)
        .map((e) => ArtistImage.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ArtistDtoToJson(ArtistDto instance) => <String, dynamic>{
      'name': instance.name,
      'listeners': instance.listeners,
      'mbid': instance.mbid,
      'url': instance.url,
      'image': instance.image.map((e) => e.toJson()).toList(),
    };
