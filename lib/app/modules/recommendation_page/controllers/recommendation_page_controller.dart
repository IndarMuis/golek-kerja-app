import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lokerku/app/routes/app_pages.dart';

class RecommendationPageController extends GetxController {
  var rekomendasi = false.obs;
  var disimpan = false.obs;
  var dataLowongan = {}.obs;
  var jumlahData = 0.obs;
  var isLoading = false.obs;
  var token = "".obs;
  var userType = 0.obs;

  List<Toko> list_of_job = [];

  onClickJob({required int jumlahKlik, required int lowonganId}) async {
    try {
      await Dio().put("http://jobfair.lentera-lipuku.com/api/umkm/count",
          queryParameters: {
            "jumlahKlik": jumlahKlik,
            "lowonganId": lowonganId,
          },
          options:
              Options(headers: {"authorization": "Bearer ${token.value}"}));

      Get.toNamed(Routes.DETAIL_JOB, arguments: {
        "lowongan_id": lowonganId,
      });
    } on DioError catch (e) {
      print(e.response);
    }
  }

  searchLowongan({String? keyword}) async {
    isLoading.value = true;
    try {
      var data = await Dio().get(
          "http://jobfair.lentera-lipuku.com/api/umkm/all",
          queryParameters: {
            "s": keyword,
          },
          options:
              Options(headers: {"authorization": "bearer ${token.value}"}));
      dataLowongan.value = await data.data;
      jumlahData.value = await dataLowongan['data'].length;
      print(dataLowongan.value);
      print("berhasil");
      isLoading.value = false;
    } on DioError catch (e) {
      isLoading.value = false;
      print(e.response);
    }
  }

  @override
  void onInit() async {
    isLoading.value = true;
    final box = GetStorage();
    token.value = box.read("token");
    userType.value = box.read("user_type");

    try {
      var data = (userType.value == 1)
          ? await Dio().get(
              "http://jobfair.lentera-lipuku.com/api/user/profil/umkm",
              options:
                  Options(headers: {"authorization": "bearer ${token.value}"}))
          : await Dio().get("http://jobfair.lentera-lipuku.com/api/umkm/all",
              options:
                  Options(headers: {"authorization": "bearer ${token.value}"}));
      dataLowongan.value = await data.data;
      jumlahData.value = await dataLowongan['data'].length;
    } on DioError catch (e) {
      print(e.response);
    }

    isLoading.value = false;
  }
}

class Toko {
  String? namaToko, lowongan, alamat, gambar, tanggal;
  Toko({this.namaToko, this.lowongan, this.alamat, this.gambar, this.tanggal});
}
