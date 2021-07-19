import 'package:apps_factory/app/data/albums/cache/hive_album_model.dart';
import 'package:apps_factory/app/data/tracks/repositories/tracks_api_repository.dart';
import 'package:apps_factory/app/domain/album/album_model.dart';
import 'package:apps_factory/app/data/albums/mappers/hive_album_mapper.dart';
import 'package:apps_factory/app/domain/errors/api_response.dart';
import 'package:apps_factory/app/domain/track/track_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class AlbumViewModel with ChangeNotifier {
  /// manage different states of the screen
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  /// cache
  final _box = Hive.box<HiveAlbumModel>('HiveAlbumModel');

  /// dependency injection for API calling
  final TracksApiRepository _trackApiRepository = TracksApiRepository();

  /// the entrance point for getting data from the API and manage screen state depending on status
  Future<void> getTracks(String mbid) async {
    _apiResponse = ApiResponse.loading('Fetching album data');
    notifyListeners();
    try {
      final List<TrackModel> response = await _trackApiRepository.getTracks(mbid: mbid);
      _apiResponse = ApiResponse.completed(response);
    } on Exception catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  /// data with search results
  ApiResponse get response => _apiResponse;

  /// check is this album in cache or not
  bool isCached(String mbid) {
    return _box.values.map((e) => e.mbid).contains(mbid);
  }

  void manageCacheAlbum({AlbumModel? album, List<TrackModel>? track}) {
    if (album != null) {
      if (_box.values.map((e) => e.mbid).contains(album.mbid)) {
        final index = _box.values.toList().indexWhere((e) => e.mbid == album.mbid);
        _box.deleteAt(index);
      } else {
        _box.add(album.toHiveModel());
      }
    }
    notifyListeners();
  }
}
