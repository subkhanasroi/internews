const String _baseUrl = "https://newsapi.org/v2/";

class API {
  _InterNews interNews = _InterNews();
}

class _InterNews {
  final String data =
      "${_baseUrl}everything?q=tesla&from=2022-04-30&sortBy=publishedAt&apiKey=1fdb719ddf31444e9cac7f1e17b10d4a";

}


