import 'package:apps_factory/app/data/artists/cache/hive_artist_model.dart';
import 'package:apps_factory/app/data/tracks/cache/hive_track_model.dart';
import 'package:hive/hive.dart';

part 'hive_album_model.g.dart';

@HiveType(typeId: 1)
class HiveAlbumModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int playcount;
  @HiveField(2)
  final String mbid;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String image;
  @HiveField(5)
  final HiveArtistModel artist;
  @HiveField(6)
  List<HiveTrackModel>? tracks;

  HiveAlbumModel(
      {this.name = '',
      this.playcount = 0,
      this.mbid = '',
      this.url = '',
      this.image = '',
      required this.artist,
      this.tracks});
}
