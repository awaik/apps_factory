import 'package:apps_factory/app/data/artists/cache/hive_artist_model.dart';
import 'package:apps_factory/app/data/artists/dto/artist_dto.dart';
import 'package:apps_factory/app/domain/api_image/api_image.dart';
import 'package:apps_factory/app/domain/artist/artist_model.dart';
import 'package:apps_factory/app/domain/artist/image_size.dart';

extension ArtistMapper on ArtistDto {
  ArtistModel toModel() => ArtistModel(
        listeners: int.parse(listeners),
        name: name,
        mbid: mbid,
        url: url,
        images: image,
      );
}

extension HiveArtistMapper on HiveArtistModel {
  ArtistModel toModel() => ArtistModel(
        listeners: listeners,
        name: name,
        mbid: mbid,
        url: url,
        images: [ApiImage(link: image, size: ImageSize.small)],
      );
}
