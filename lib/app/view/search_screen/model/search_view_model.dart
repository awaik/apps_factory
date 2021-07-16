import 'package:apps_factory/app/data/artists/repositories/artist_api_repository.dart';
import 'package:apps_factory/app/domain/artist/artist_model.dart';
import 'package:apps_factory/app/domain/errors/api_response.dart';
import 'package:flutter/cupertino.dart';

class SearchViewModel with ChangeNotifier {
  /// manage different states of the screen
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  /// dependency injection for API calling
  final ArtistApiRepository _artistApiRepository = ArtistApiRepository();

  /// the entrance point for getting data from the API and manage screen state depending on status
  Future<void> getArtists(String request) async {
    _apiResponse = ApiResponse.loading('Fetching artist data');
    notifyListeners();
    try {
      // returns type Either<FetchDataException, List<ArtistModel>>
      final List<ArtistModel> response =
          await _artistApiRepository.getArtists(artist: request);
      _apiResponse = ApiResponse.completed(response);
    } on Exception catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  /// data with search results
  ApiResponse get response => _apiResponse;
}
