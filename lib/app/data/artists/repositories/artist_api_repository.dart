import 'package:apps_factory/app/data/artists/dto/artist_dto.dart';
import 'package:apps_factory/app/data/artists/services/artist_service.dart';
import 'package:apps_factory/app/domain/artist/artist_model.dart';
import 'package:apps_factory/app/data/artists/mappers/artist_mapper.dart';

class ArtistApiRepository {
  final ArtistService _client = ArtistService();

  Future<List<ArtistModel>> getArtists({String artist = ''}) async {
    final response = await _client.getResponse(artist);
    final jsonData = response['results']['artistmatches']['artist'] as List;
    final List<ArtistModel> artistList =
        jsonData.map((val) => ArtistDto.fromJson(val).toModel()).toList();
    return artistList;
  }
}
