import 'package:dio/dio.dart' as dio;
import 'package:internews/data/repo.dart';

late Repo _repo;

class Request {
  late _Data data;

  Request() {
    _repo = Repo();
    data = _Data();
  }
}

class _Data {
  Future<dio.Response> loadData({
    String? q,
    String? from,
    String? sortBy,
    String? apiKey,
  }) {
    return _repo.data.data(param: {
      "q": q,
      "from": from,
      "sortBy": sortBy,
      "apiKey": "1fdb719ddf31444e9cac7f1e17b10d4a"
    });
  }
}
