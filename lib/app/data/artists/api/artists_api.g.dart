// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artists_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ArtistsApi implements ArtistsApi {
  _ArtistsApi(this._dio, {this.baseUrl}) {
    baseUrl ??=
        'https://ws.audioscrobbler.com/2.0/?method=artist.search&api_key=8b2b3da25942752b1088bb0d1639a0ae&format=json';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<ArtistDto>> getArtists(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(request.toJson());
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ArtistDto>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/shorten',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ArtistDto.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
