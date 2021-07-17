import 'package:apps_factory/app/data/albums/repositories/album_api_repository.dart';
import 'package:apps_factory/app/domain/album/album_model.dart';
import 'package:apps_factory/app/domain/errors/api_response.dart';
import 'package:flutter/cupertino.dart';

class AlbumsViewModel with ChangeNotifier {
  /// manage different states of the screen
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  /// dependency injection for API calling
  final AlbumApiRepository _albumApiRepository = AlbumApiRepository();

  /// the entrance point for getting data from the API and manage screen state depending on status
  Future<void> getAlbums(String mbid) async {
    _apiResponse = ApiResponse.loading('Fetching artist data');
    notifyListeners();
    try {
      final List<AlbumModel> response =
          await _albumApiRepository.getAlbums(mbid: mbid);
      _apiResponse = ApiResponse.completed(response);
    } on Exception catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  /// data with search results
  ApiResponse get response => _apiResponse;
}
