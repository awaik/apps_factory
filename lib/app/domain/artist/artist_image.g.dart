// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistImage _$ArtistImageFromJson(Map<String, dynamic> json) {
  return ArtistImage(
    link: json['#text'] as String,
    size: _$enumDecode(_$ImageSizeEnumMap, json['size']),
  );
}

Map<String, dynamic> _$ArtistImageToJson(ArtistImage instance) =>
    <String, dynamic>{
      '#text': instance.link,
      'size': _$ImageSizeEnumMap[instance.size],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$ImageSizeEnumMap = {
  ImageSize.small: 'small',
  ImageSize.medium: 'medium',
  ImageSize.large: 'large',
  ImageSize.extralarge: 'extralarge',
  ImageSize.mega: 'mega',
};
