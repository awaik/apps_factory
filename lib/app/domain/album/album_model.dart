import 'package:apps_factory/app/domain/api_image/api_image.dart';
import 'package:apps_factory/app/domain/artist/artist_model.dart';

class AlbumModel {
  final String name;
  final int playcount;
  final String mbid;
  final String url;
  final List<ApiImage> images;
  final ArtistModel? artist;

  AlbumModel(
      {this.name = '',
      this.playcount = 0,
      this.mbid = '',
      this.url = '',
      this.images = const [],
      this.artist});
}
