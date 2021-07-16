import 'package:apps_factory/app/data/artists/dto/artist_request_dto.dart';
import 'package:apps_factory/app/data/artists/dto/artist_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'artists_api.g.dart';

@RestApi(baseUrl: 'https://ws.audioscrobbler.com/2.0/?method=artist.search&api_key=8b2b3da25942752b1088bb0d1639a0ae&format=json')
abstract class ArtistsApi {
  factory ArtistsApi(Dio dio, {String baseUrl}) = _ArtistsApi;

  @GET('/shorten')
  Future<List<ArtistDto>> getArtists(@Queries() ArtistRequestDto request);
}
