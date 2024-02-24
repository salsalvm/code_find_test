import 'dart:developer';

import 'package:camera_finder/res/app_urls.dart';
import 'package:http/http.dart' as http;

class CameraServiceEndPont {
  Future<http.Response?> getCameraInfo(String timeStamp) async {
    try {
      final Uri uri = Uri.parse('${Apis().kBaseUrl}?date_time=$timeStamp');
      final http.Response response = await http.get(uri);
      log('api url ->  $uri');
      return response;
    } catch (e) {
      log('get home service>>>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<<<');
    }
    return null;
  }
}
