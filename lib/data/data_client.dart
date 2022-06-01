import 'dart:convert';

import 'package:internews/data/environtment.dart';
import 'package:internews/model/list_news_model.dart';
import 'package:http/http.dart' as http;

class DataClient {
  Future<ListNewsModel> getInternationalNews() async {
    String url =
        "${Env.baseUrl}/v2/everything?q=international&from=2022-04-30&sortBy=publishedAt&apiKey=${Env.apiKey}";
    return http
        .get(
          Uri.parse(url),
        )
        .timeout(const Duration(seconds: 12))
        .then((res) {

      return ListNewsModel.fromJson(json.decode(res.body));
    });
  }

  Future<ListNewsModel> getLocalNews() async {
    String url =
        "${Env.baseUrl}/v2/top-headlines?apiKey=${Env.apiKey}&country=id&category=business";
    return http
        .get(
          Uri.parse(url),
        )
        .timeout(const Duration(seconds: 12))
        .then((res) {

      return ListNewsModel.fromJson(json.decode(res.body));
    });
  }
  Future<ListNewsModel> getBusinessNews() async {
    String url =
        "${Env.baseUrl}/v2/top-headlines?apiKey=${Env.apiKey}&country=us&category=business";
    return http
        .get(
          Uri.parse(url),
        )
        .timeout(const Duration(seconds: 12))
        .then((res) {

      return ListNewsModel.fromJson(json.decode(res.body));
    });
  }
}
