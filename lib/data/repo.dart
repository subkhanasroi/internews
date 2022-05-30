import 'package:dio/dio.dart' as dio;
import 'package:internews/data/api.dart';
import 'package:internews/data/dio.dart';

late API _api;
late Dio _dio;

class Repo {
  late _Data data = _Data();

  Repo() {
    _api = API();
    _dio = Dio();
    data = _Data();
  }
}

class _Data {
  Future<dio.Response> data({Map<String, dynamic>? param}) async {
    return await _dio.get(
      url: _api.interNews.data,
      param: param,
    );
  }
}
