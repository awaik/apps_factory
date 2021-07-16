import 'package:apps_factory/app/domain/artist/image_size.dart';
import 'package:json_annotation/json_annotation.dart';

part 'artist_image.g.dart';

@JsonSerializable(explicitToJson: true)
class ArtistImage {
  @JsonKey(name: '#text')
  final String link;
  final ImageSize size;

  ArtistImage({this.link = '', this.size = ImageSize.small});

  factory ArtistImage.fromJson(Map<String, dynamic> json) => _$ArtistImageFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistImageToJson(this);
}
