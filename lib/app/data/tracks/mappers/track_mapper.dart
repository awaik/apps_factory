import 'package:apps_factory/app/data/artists/mappers/artist_mapper.dart';
import 'package:apps_factory/app/data/tracks/dto/track_dto.dart';
import 'package:apps_factory/app/domain/track/track_model.dart';

extension TrackMapper on TrackDto {
  TrackModel toModel() => TrackModel(
      name: name,
      url: url,
      rank: rank,
      duration: duration,
      artist: artist.toModel());
}
