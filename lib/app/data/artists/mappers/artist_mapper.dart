import 'package:apps_factory/app/data/artists/dto/artist_dto.dart';
import 'package:apps_factory/app/domain/artist/artist_model.dart';

extension ArtistMapper on ArtistDto {
  ArtistModel toModel() => ArtistModel(listeners: listeners, name: name, url: url, images: image);
}