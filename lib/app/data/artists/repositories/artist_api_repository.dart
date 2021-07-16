import 'dart:convert';
import 'package:apps_factory/app/data/artists/api/artists_api.dart';
import 'package:apps_factory/app/data/artists/dto/artist_request_dto.dart';
import 'package:apps_factory/app/domain/artist/artist_model.dart';
import 'package:apps_factory/app/data/artists/mappers/artist_mapper.dart';
import 'package:apps_factory/app/domain/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

const ERROR_MSG = 'Something went wrong';

class ArtistApiRepository {
  final ArtistsApi client = ArtistsApi(Dio(BaseOptions(contentType: "application/json")));

  /// return Failure if catch error or status code is not 200
  Future<Either<Failure, List<ArtistModel>>> getArtists({String artist = ''}) async {
    try {
      final artists = await client.getArtists(ArtistRequestDto(artist: artist));
      return Right(artists.map((e) => e.toModel).toList() as List<ArtistModel>);
    } on DioError catch (error) {
      var message = '';
      try {
        message = jsonDecode(error.response.toString())['error'];
      } catch (e) {
        message = error.message;
      }
      return Left(Failure(message));
    } on Exception catch (_) {
      return const Left(Failure(ERROR_MSG));
    }
  }
}
