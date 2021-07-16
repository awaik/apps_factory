import 'artist_image.dart';

class ArtistModel {
  final String name;
  final int listeners;
  final String url;
  final List<ArtistImage> images;

  ArtistModel({this.name = '', this.listeners = 0, this.url = '', this.images = const []});
}
