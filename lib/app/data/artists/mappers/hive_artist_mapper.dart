import 'package:apps_factory/app/data/artists/cache/hive_artist_model.dart';
import 'package:apps_factory/app/domain/artist/artist_model.dart';
import 'package:apps_factory/app/domain/artist/image_size.dart';

extension HiveArtistMapper on ArtistModel {
  HiveArtistModel toHiveModel() {

    print('++++++++++++++++++++++++++++++11 -- ${images.length}');

    return HiveArtistModel(
        listeners: listeners,
        name: name,
        mbid: mbid,
        url: url,
        image: (images.isNotEmpty) ? images.firstWhere((e) => e.size == ImageSize.small).link : '',
      );}
}
