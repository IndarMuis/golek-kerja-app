import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lokerku/app/helper/notifications.dart';
import 'package:lokerku/app/routes/app_pages.dart';

class DetailProfilePelamarController extends GetxController {
  Dio _dio = Dio();
  var dataArguments = {}.obs;
  var token = "".obs;
  var profilePelamar = {}.obs;
  var pengalamanPelamar = [].obs;

  var isLoading = false.obs;

  terimaPelamar() async {
    isLoading.value = true;
    try {
      var data = await _dio.put(
          "http://jobfair.lentera-lipuku.com/api/umkm/terima-lamaran",
          queryParameters: {
            "daftar_lowongan_id": dataArguments["daftar_lowongan_id"],
            "pelamar_id": dataArguments['pelamar_id'],
          },
          options: Options(headers: {
            "authorization": "bearer ${token.value}",
          }));
      print("Berhasil");
      print(data.data);
      successSnackBar(title: "Successs", message: "Berhasil menerima pelamar");
      Get.offAllNamed(Routes.HOME);
      isLoading.value = false;
    } on DioError catch (e) {
      errorSnackBar(title: "Error", message: "Gagal menerima pelamar");
      isLoading.value = false;
      print(e.response);
    }
  }

  tolakPelamar() async {
    isLoading.value = true;
    try {
      var data = await _dio.put(
          "http://jobfair.lentera-lipuku.com/api/umkm/tolak-lamaran",
          queryParameters: {
            "daftar_lowongan_id": dataArguments["daftar_lowongan_id"],
            "pelamar_id": dataArguments['pelamar_id'],
          },
          options: Options(headers: {
            "authorization": "bearer ${token.value}",
          }));
      print("Berhasil");
      print(data.data);
      successSnackBar(title: "Successs", message: "Berhasil menolak lamaran");
      Get.offAllNamed(Routes.HOME);
      isLoading.value = false;
    } on DioError catch (e) {
      isLoading.value = false;
      print(e.response);
    }
  }

  @override
  void onInit() async {
    isLoading.value = true;
    var arguments = await Get.arguments;
    dataArguments.value = await arguments;
    var box = GetStorage();
    token.value = box.read("token");

    print(dataArguments.value);
    print(token.value);

    try {
      var data =
          await _dio.get("http://jobfair.lentera-lipuku.com/api/pelamar/detail",
              queryParameters: {
                "pelamar_id": dataArguments['pelamar_id'],
                "daftar_lowongan_id": dataArguments["daftar_lowongan_id"],
                "umkm_id": dataArguments["umkm_id"],
              },
              options: Options(headers: {
                "authorization": "bearer ${token.value}",
              }));

      profilePelamar.value = data.data['data']['pelamar'][0];
      pengalamanPelamar.value = data.data['data']['pengalaman'];
      print(dataArguments.value['status_lowongan']);
    } on DioError catch (e) {
      print(e.response);
    }

    isLoading.value = false;
    super.onInit();
  }

  @override
  void onClose() {}
}
