import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class JobHistoryController extends GetxController {
  Dio dio = new Dio();
  var isLoading = false.obs;
  var riwayatLowongan = [].obs;
  var token = "".obs;
  var userType = 0.obs;
  var valid = false.obs;

  @override
  void onInit() async {
    isLoading.value = true;
    final box = GetStorage();
    token.value = box.read("token");
    userType.value = box.read("user_type");

    var data = await dio.get(
      "http://jobfair.lentera-lipuku.com/api/umkm/riwayat/lowongan",
      options: Options(
        headers: {"authorization": "Bearer ${token.value}"},
      ),
    );
    print(data.data['data']);

    riwayatLowongan.value = await data.data['data'];
    isLoading.value = false;

    super.onInit();
  }
}
