import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lokerku/app/routes/app_pages.dart';

class ProfileUsahaEditController extends GetxController {
  Dio dio = new Dio();
  var loading = false.obs;
  var dataUsaha = {}.obs;

  List<String> jenisUsaha = ["Kuliner", "Fashion", "Agribisnis"];
  var pilihanJenisUsaha = "".obs;
  var tahunUsahaBerdiri = "".obs;
  late TextEditingController namaUsahaController;
  late TextEditingController alamatUsahaController;
  late TextEditingController emailController;
  late TextEditingController nomorController;
  RxString token = "".obs;
  var userType = 0.obs;
  var valid = false.obs;

  final count = 0.obs;

  void saveEditUsahaProfile() async {
    loading.value = true;
    try {
      var data = await dio.put(
        "http://jobfair.lentera-lipuku.com/api/user/profil/umkm/edit",
        data: {
          "nama_toko": (namaUsahaController.text.isEmpty)
              ? dataUsaha['data']['nama_toko']
              : namaUsahaController.text,
          "jenis_usaha": (pilihanJenisUsaha.value.isEmpty)
              ? dataUsaha['data']['jenis_usaha']
              : pilihanJenisUsaha.value,
          "tahun_berdiri": (tahunUsahaBerdiri.value.isEmpty)
              ? dataUsaha['data']['tahun_berdiri']
              : int.parse(tahunUsahaBerdiri.value),
          "email": (emailController.text.isEmpty)
              ? dataUsaha['data']['email']
              : emailController.text,
          "no_hp": (nomorController.text.isEmpty)
              ? dataUsaha['data']['no_hp']
              : nomorController.text,
          "alamat": (alamatUsahaController.text.isEmpty)
              ? dataUsaha['data']['alamat']
              : alamatUsahaController.text,
        },
        options: Options(
          headers: {
            "authorization": "bearer ${token.value}",
          },
        ),
      );
      loading.value = false;
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      loading.value = false;
      print(e.toString());
    }
  }

  @override
  void onInit() {
    namaUsahaController = new TextEditingController();
    alamatUsahaController = new TextEditingController();
    emailController = new TextEditingController();
    nomorController = new TextEditingController();

    final box = GetStorage();
    token.value = box.read("token");
    userType.value = box.read("user_type");
    valid.value = box.read("valid");

    dataUsaha.value = Get.arguments;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
