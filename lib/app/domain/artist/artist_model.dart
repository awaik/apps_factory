import '../api_image/api_image.dart';

class ArtistModel {
  final String name;
  final String mbid;
  final int listeners;
  final String url;
  final List<ApiImage> images;

  ArtistModel({this.name = '', this.mbid = '', this.listeners = 0, this.url = '', this.images = const []});
}
