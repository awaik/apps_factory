import 'dart:convert';
import 'package:apps_factory/app/domain/errors/app_exception.dart';
import 'package:http/http.dart' as http;

abstract class BaseService {
  final String mediaBaseUrl =
      'https://ws.audioscrobbler.com/2.0/?api_key=8b2b3da25942752b1088bb0d1639a0ae&format=json';

  Future<dynamic> getResponse(String request);

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server with status code : ${response.statusCode}');
    }
  }
}
