import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lokerku/app/helper/notifications.dart';
import 'package:lokerku/app/routes/app_pages.dart';

class DetailJobController extends GetxController {
  var id = 0.obs;
  var token = "".obs;
  var isLoading = false.obs;

  var lowonganIsSave = false.obs;
  var dataSave = [].obs;

  var dataDetailLowongan = {}.obs;
  var dio = new Dio();
  var deskripsi = [].obs;
  var persyaratan = {}.obs;

  void simpanLowongan() async {
    isLoading.value = true;
    try {
      await dio.post(
        "http://jobfair.lentera-lipuku.com/api/user/save-lowongan",
        data: {
          "lowongan_id": dataDetailLowongan['id_lowongan'],
          "saved": 1,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer ${token.value}",
          },
        ),
      );
      isLoading.value = false;
      print("Berhasil menyimpan lowongan");
      Get.offAllNamed(Routes.HOME);
    } on DioError catch (e) {
      print(e.message);
      print(e.error);
    }
  }

  void hapusSimpanLowongan() async {
    isLoading.value = true;
    try {
      await dio.post(
        "http://jobfair.lentera-lipuku.com/api/user/save-lowongan",
        data: {
          "lowongan_id": dataDetailLowongan['id_lowongan'],
          "saved": 0,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer ${token.value}",
          },
        ),
      );
      isLoading.value = false;
      print("Berhasil menghapus lowongan");
      Get.offAllNamed(Routes.HOME);
    } on DioError catch (e) {
      isLoading.value = false;
      print(e.message);
    }
  }

  void daftarLowongan() async {
    isLoading.value = true;
    print(dataDetailLowongan['id_lowongan']);
    try {
      var data = await dio.post(
        "http://jobfair.lentera-lipuku.com/api/pelamar/daftar-lowongan",
        data: {
          "lowongan_id": dataDetailLowongan['id_lowongan'],
          "status": 0,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer ${token.value}",
          },
        ),
      );
      await successSnackBar(
          title: "PENDAFTARAN BERHASIL",
          message: "Berhasil mendaftar lowongan");
      print("berhasil");
      Get.offAllNamed(Routes.HOME);
      isLoading.value = false;
    } on DioError catch (e) {
      isLoading.value = false;
      errorSnackBar(
          title: "PENDAFTARAN GAGAL",
          message: "${e.response!.data['message']}");
      Get.offAllNamed(Routes.HOME);
      print(e.message);
      print(e.response!);
    }
  }

  @override
  void onInit() async {
    id.value = await Get.arguments['lowongan_id'];
    isLoading.value = true;
    final box = GetStorage();
    token.value = box.read("token");

    try {
      var data = await dio.get(
        "http://jobfair.lentera-lipuku.com/api/umkm/lowongan/detail/${id.value}",
        options: Options(headers: {"authorization": "bearer ${token.value}"}),
      );
      var daftarSaveLowongan = await dio.get(
        "http://jobfair.lentera-lipuku.com/api/umkm/saved",
        options: Options(headers: {"authorization": "bearer ${token.value}"}),
      );

      dataDetailLowongan.value = await data.data['data'];
      deskripsi.value = await data.data['data']['deskripsi'];
      persyaratan.value = await data.data['data']['persyaratan'];

      dataSave.value = daftarSaveLowongan.data['data'];

      dataSave.forEach((element) {
        if (element['saved'] == 1 &&
            element['lowongan_id'] == dataDetailLowongan['id_lowongan']) {
          lowonganIsSave.value = true;
        }
      });
    } on DioError catch (e) {
      print(e.response);
    }

    print(dataDetailLowongan);

    isLoading.value = false;
    super.onInit();
  }
}
