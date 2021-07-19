import 'package:apps_factory/app/data/artists/cache/hive_artist_model.dart';
import 'package:hive/hive.dart';

part 'hive_track_model.g.dart';

@HiveType(typeId: 2)
class HiveTrackModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String url;
  @HiveField(2)
  final int rank;
  @HiveField(3)
  final int duration;
  @HiveField(4)
  final HiveArtistModel artist;

  HiveTrackModel(
      {this.name = '',
      this.url = '',
      this.rank = 0,
      this.duration = 0,
      required this.artist});
}
