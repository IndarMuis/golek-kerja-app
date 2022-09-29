import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HistoryLamaranKerjaController extends GetxController {
  Dio _dio = new Dio();
  var isLoading = false.obs;

  var dataLamaran = [].obs;
  var token = "".obs;
  @override
  void onInit() async {
    isLoading.value = true;
    var storage = GetStorage();
    token.value = storage.read("token");
    try {
      var data = await _dio.get(
          "http://jobfair.lentera-lipuku.com/api/pelamar/list-lowongan",
          options:
              Options(headers: {"authorization": "bearer ${token.value}"}));

      dataLamaran.value = data.data['data'];
      print(dataLamaran);
      isLoading.value = false;
    } on DioError catch (e) {
      isLoading.value = false;
      print(e.response);
    }
    super.onInit();
  }
}
