import 'package:apps_factory/app/data/albums/cache/hive_album_model.dart';
import 'package:apps_factory/app/data/albums/dto/album_dto.dart';
import 'package:apps_factory/app/data/artists/mappers/artist_mapper.dart';
import 'package:apps_factory/app/domain/album/album_model.dart';
import 'package:apps_factory/app/domain/api_image/api_image.dart';
import 'package:apps_factory/app/domain/artist/image_size.dart';

extension AlbumMapper on AlbumDto {
  AlbumModel toModel() => AlbumModel(
        playcount: playcount,
        name: name,
        mbid: mbid,
        url: url,
        images: image,
        artist: artist.toModel(),
      );
}

extension HiveAlbumMapper on HiveAlbumModel {
  AlbumModel toModel() => AlbumModel(
        playcount: playcount,
        name: name,
        mbid: mbid,
        url: url,
        images: [ApiImage(link: image, size: ImageSize.small)],
        artist: artist.toModel(),
      );
}
