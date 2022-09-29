import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lokerku/app/helper/notifications.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

class PengalamanController extends GetxController {
  Dio dio = new Dio();
  var loading = false.obs;

  List<String> jenisUsaha = ["Kuliner", "Fashion", "Agribisnis"];
  var pilihanJenisUsaha = "".obs;

  // List<String> pendidikanTerakhir = ["SD", "SMP", "SMA", "S1"];
  // var pilihanPendidikanTerakhir = "".obs;

  late TextEditingController posisiController = new TextEditingController();
  late TextEditingController namaUsahaController = new TextEditingController();
  late TextEditingController tahunController = new TextEditingController();
  late TextEditingController lokasiController = new TextEditingController();

  RxString token = "".obs;
  var userType = 0.obs;
  var valid = false.obs;

  saveDataPengalaman() async {
    final box = GetStorage();
    try {
      print("TOKEN LAMA : ${token.value}");
      print("USER TYPE : ${userType.value}");
      print("VALID : ${valid.value}");
      if (posisiController.text.isNotEmpty &&
          namaUsahaController.text.isNotEmpty &&
          pilihanJenisUsaha.value.isNotEmpty &&
          lokasiController.text.isNotEmpty) {
        loading.value = true;
        var data = await dio.post(
            "http://jobfair.lentera-lipuku.com/api/user/pengalaman",
            data: {
              "posisi": posisiController.text,
              "nama_perusahaan": namaUsahaController.text,
              "jenis_usaha": pilihanJenisUsaha.value,
              "tahun": int.parse(tahunController.text),
              "lokasi": lokasiController.text
            },
            options:
                Options(headers: {"Authorization": "Bearer ${token.value}"}));
        print(data.data);
        // token.value = data.data['data']['token'];
        // print("TOKEN BARU ${token.value}");
        // box.write('token', "${token.value}");
        // NOTIF BERHASIL
        loading.value = false;
        await successSnackBar(
            title: "BERHASIL MENYIMPAN DATA",
            message: "Data Pengalaman Anda Berhasil Disimpan");
        print(data.data);
        Get.offAllNamed(Routes.PENGALAMAN);
      } else {
        loading.value = false;
        await errorSnackBar(
            title: "GAGAL MENYIMPAN DATA",
            message: "Silahkan Periksa Kembali Inputan Anda");
        print("Gagal else");
      }
    } on DioError catch (e) {
      loading.value = false;
      await errorSnackBar(
          title: "GAGAL MENYIMPAN DATA",
          message: "Silahkan Periksa Kembali Inputan Anda");
    }
  }

  @override
  void onInit() {
    posisiController = new TextEditingController();
    namaUsahaController = new TextEditingController();
    tahunController = new TextEditingController();
    lokasiController = new TextEditingController();
    print("Get Token");
    final box = GetStorage();
    token.value = box.read("token");
    userType.value = box.read("user_type");
    valid.value = box.read("valid");
    super.onInit();
  }

  @override
  void onClose() async {
    posisiController.clear();
    namaUsahaController.clear();
    tahunController.clear();
    lokasiController.clear();
    super.onClose();
  }
}
