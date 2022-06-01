import 'package:get/get.dart';
import 'package:internews/data/data_client.dart';
import 'package:internews/model/list_news_model.dart';

class LoadDataController extends GetxController {
  final DataClient _dataClient = DataClient();
  late ListNewsModel listInternational;
  late ListNewsModel listLocal;
  late ListNewsModel listBusiness;

  @override
  void onInit() {
    super.onInit();
    listInternational = ListNewsModel();
    listLocal = ListNewsModel();
    listBusiness = ListNewsModel();
    internationalNews();
    localNews();
    businessNews();
  }

  Future<void> internationalNews() async {
    await _dataClient.getInternationalNews().then((response) async {
      if (response.status == "ok") {
        listInternational = response;
        update();
      }
    }).catchError((e) {});
  }

  Future<void> localNews() async {
    await _dataClient.getLocalNews().then((response) async {
      if (response.status == "ok") {
        listLocal = response;
        update();
      }
    }).catchError((e) {});
  }

  Future<void> businessNews() async {
    await _dataClient.getBusinessNews().then((response) async {
      if (response.status == "ok") {
        listBusiness = response;
        update();
      }
    }).catchError((e) {});
  }
}
