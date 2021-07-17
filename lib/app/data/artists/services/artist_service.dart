import 'dart:io';
import 'package:apps_factory/app/domain/errors/app_exception.dart';
import 'package:http/http.dart' as http;

import '../../services/base_service.dart';

class ArtistService extends BaseService {
  @override
  Future getResponse(String artist) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse('$mediaBaseUrl&method=artist.search&artist=$artist'));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
}
