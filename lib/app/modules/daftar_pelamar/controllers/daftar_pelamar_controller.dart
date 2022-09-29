import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DaftarPelamarController extends GetxController {
  var daftarPelamar = [].obs;

  Dio dio = new Dio();
  var isLoading = false.obs;
  var token = "".obs;
  var userType = 0.obs;

  @override
  void onReady() {
    print("ready");
    super.onReady();
  }

  @override
  void onInit() async {
    super.onInit();

    print("ON INTI");
    isLoading.value = true;
    final box = GetStorage();
    token.value = box.read("token");
    userType.value = box.read("user_type");

    var data = await dio.get(
      "http://jobfair.lentera-lipuku.com/api/umkm/list-pelamar",
      options: Options(
        headers: {"authorization": "Bearer ${token.value}"},
      ),
    );
    print(data.data['data']);

    daftarPelamar.value = await data.data['data'];
    isLoading.value = false;
  }

  @override
  void onClose() {}
}
