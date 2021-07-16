abstract class BaseService {
  final String mediaBaseUrl =
      'https://ws.audioscrobbler.com/2.0/?method=artist.search&api_key=8b2b3da25942752b1088bb0d1639a0ae&format=json&artist=';

  Future<dynamic> getResponse(String artist);
}
