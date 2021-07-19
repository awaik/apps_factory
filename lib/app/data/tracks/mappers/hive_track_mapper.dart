import 'package:apps_factory/app/data/tracks/cache/hive_track_model.dart';
import 'package:apps_factory/app/data/artists/mappers/hive_artist_mapper.dart';
import 'package:apps_factory/app/domain/track/track_model.dart';

extension HiveTrackMapper on TrackModel {
  HiveTrackModel toHiveModel() {
    return HiveTrackModel(
      name: name,
      rank: rank,
      duration: duration,
      url: url,
      artist: artist.toHiveModel(),
    );
  }
}
