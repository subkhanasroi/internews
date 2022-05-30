import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart' as d;

class Dio {
  late d.Dio _dio;

  Future get({
    required String url,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.get(
        url,
        queryParameters: param,
      );
    } on TimeoutException catch (e) {
      return Future.error(e);
    } on SocketException catch (e) {
      return Future.error(e);
    } on d.DioError catch (e) {
      return Future.error(e);
    }
  }
}
