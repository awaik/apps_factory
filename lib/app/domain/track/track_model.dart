import 'package:apps_factory/app/domain/artist/artist_model.dart';

class TrackModel {
  final String name;
  final String url;

  /// position in the album

  final int rank;
  final int duration;
  final ArtistModel artist;

  TrackModel(
      {this.name = '',
      this.url = '',
      this.rank = 0,
      this.duration = 0,
      required this.artist});
}
