import 'package:apps_factory/app/data/albums/dto/album_dto.dart';
import 'package:apps_factory/app/data/albums/services/album_service.dart';
import 'package:apps_factory/app/domain/album/album_model.dart';
import 'package:apps_factory/app/data/albums/mappers/album_mapper.dart';

class AlbumApiRepository {
  final AlbumService _client = AlbumService();

  Future<List<AlbumModel>> getAlbums({String mbid = ''}) async {
    final response = await _client.getResponse(mbid);
    final jsonData = response['topalbums']['album'] as List;
    final List<AlbumModel> albumList = jsonData.map((val) => AlbumDto.fromJson(val).toModel()).toList();
    return albumList;
  }
}
