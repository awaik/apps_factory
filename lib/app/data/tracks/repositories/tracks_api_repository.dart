import 'package:apps_factory/app/data/tracks/dto/track_dto.dart';
import 'package:apps_factory/app/data/tracks/mappers/track_mapper.dart';
import 'package:apps_factory/app/data/tracks/services/tracks_service.dart';
import 'package:apps_factory/app/domain/track/track_model.dart';

class TracksApiRepository {
  final TracksService _client = TracksService();

  Future<List<TrackModel>> getTracks({String mbid = ''}) async {
    final response = await _client.getResponse(mbid);
    final jsonData = response['album']['tracks']['track'] ?? [];
    // sometimes answer is {track: [{artist: {url:
    // sometimes is {track: {artist: {url:
    final List<TrackModel> trackList = [];
    try {
      for (final t in jsonData) {
        trackList.add(TrackDto.fromJson(t).toModel());
      }
    } catch (e) {
      trackList.add(TrackDto.fromJson(jsonData).toModel());
    }
    return trackList;
  }
}
