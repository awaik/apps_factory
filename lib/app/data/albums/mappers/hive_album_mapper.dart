import 'package:apps_factory/app/data/albums/cache/hive_album_model.dart';
import 'package:apps_factory/app/domain/album/album_model.dart';
import 'package:apps_factory/app/domain/artist/image_size.dart';
import 'package:apps_factory/app/data/artists/mappers/hive_artist_mapper.dart';

extension HiveAlbumMapper on AlbumModel {
  HiveAlbumModel toHiveModel() {
    return HiveAlbumModel(
        playcount: playcount,
        name: name,
        mbid: mbid,
        url: url,
        image: images.firstWhere((e) => e.size == ImageSize.small).link,
        artist: artist.toHiveModel());
  }
}
