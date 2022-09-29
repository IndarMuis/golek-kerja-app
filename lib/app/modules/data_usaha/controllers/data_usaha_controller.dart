import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lokerku/app/helper/notifications.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

class DataUsahaController extends GetxController {
  Dio dio = new Dio();
  var loading = false.obs;

  List<String> jenisUsaha = ["Kuliner", "Fashion", "Agribisnis"];
  var pilihanJenisUsaha = "".obs;
  var tahunUsahaBerdiri = "".obs;
  late TextEditingController namaUsahaController;
  late TextEditingController alamatUsahaController;
  late TextEditingController tahunBerdiriController;
  RxString token = "".obs;
  var userType = 0.obs;
  var valid = false.obs;

  saveDataUsaha(String namaUsaha, String pilihanJenisUsaha,
      String tahunUsahaBerdiri, String alamatUsaha) async {
    final box = GetStorage();
    try {
      print("TOKEN LAMA : ${token.value}");
      print("USER TYPE : ${userType.value}");
      print("VALID : ${valid.value}");
      if (namaUsaha.isNotEmpty &&
          pilihanJenisUsaha.isNotEmpty &&
          tahunUsahaBerdiri.isNotEmpty &&
          alamatUsaha.isNotEmpty) {
        loading.value = true;
        var data = await dio.post(
            "http://jobfair.lentera-lipuku.com/api/auth/data-diri/umkm",
            data: {
              "nama_toko": namaUsaha,
              "jenis_usaha": pilihanJenisUsaha,
              "tahun_berdiri": tahunBerdiriController.text,
              "alamat": alamatUsaha
            },
            options:
                Options(headers: {"Authorization": "Bearer ${token.value}"}));
        print(data.data);
        token.value = data.data['data']['token'];
        print("TOKEN BARU ${token.value}");
        box.write('token', "${token.value}");
        successSnackBar(
            title: "DATA DISIMPAN", message: "Berhasil menyimpan data usaha");
        print(data.data);
        loading.value = false;
        Get.offAllNamed(Routes.HOME);
      } else {
        print("Gagal else");
      }
    } catch (e) {
      loading.value = false;
      print("Gagal catch");
      print(e.toString());
      print(token.value);
    }
  }

  @override
  void onInit() {
    namaUsahaController = new TextEditingController();
    alamatUsahaController = new TextEditingController();
    tahunBerdiriController = new TextEditingController();

    print("Get Token");
    final box = GetStorage();
    token.value = box.read("token");
    userType.value = box.read("user_type");
    valid.value = box.read("valid");
    super.onInit();
  }

  @override
  void onClose() async {
    namaUsahaController.clear();
    alamatUsahaController.clear();
    tahunBerdiriController.clear();

    dio.close();
    super.onClose();
  }
}
