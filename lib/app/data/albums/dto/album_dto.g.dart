// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumDto _$AlbumDtoFromJson(Map<String, dynamic> json) {
  return AlbumDto(
    name: json['name'] as String,
    playcount: json['playcount'] as int? ?? 0,
    mbid: json['mbid'] as String? ?? '',
    url: json['url'] as String? ?? '',
    image: (json['image'] as List<dynamic>)
        .map((e) => ApiImage.fromJson(e as Map<String, dynamic>))
        .toList(),
    artist: ArtistDto.fromJson(json['artist'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AlbumDtoToJson(AlbumDto instance) => <String, dynamic>{
      'name': instance.name,
      'playcount': instance.playcount,
      'mbid': instance.mbid,
      'url': instance.url,
      'image': instance.image.map((e) => e.toJson()).toList(),
      'artist': instance.artist.toJson(),
    };
