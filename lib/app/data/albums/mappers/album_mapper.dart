import 'package:apps_factory/app/data/albums/dto/album_dto.dart';
import 'package:apps_factory/app/data/artists/mappers/artist_mapper.dart';
import 'package:apps_factory/app/domain/album/album_model.dart';

extension AlbumMapper on AlbumDto {
  AlbumModel toModel() => AlbumModel(
      playcount: playcount, name: name, mbid: mbid, url: url, images: image, artist: artist.toModel());
}
