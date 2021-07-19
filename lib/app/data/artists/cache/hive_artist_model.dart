import 'package:hive/hive.dart';

part 'hive_artist_model.g.dart';

@HiveType(typeId: 0)
class HiveArtistModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String mbid;
  @HiveField(2)
  final int listeners;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String image;

  HiveArtistModel(
      {this.name = '',
      this.mbid = '',
      this.listeners = 0,
      this.url = '',
      this.image = ''});
}
