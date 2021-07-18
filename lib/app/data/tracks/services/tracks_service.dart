import 'dart:io';
import 'package:apps_factory/app/domain/errors/app_exception.dart';
import 'package:http/http.dart' as http;

import '../../services/base_service.dart';

class TracksService extends BaseService {
  @override
  Future getResponse(String request) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse('$mediaBaseUrl&method=album.getinfo&mbid=$request'));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
}
