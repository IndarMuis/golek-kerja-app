import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokerku/app/helper/notifications.dart';
import 'package:lokerku/app/routes/app_pages.dart';

import '../../../theme.dart';

class RegisterController extends GetxController {
  final dio = Dio();
  var loading = false.obs;

  // REGISTRASI
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController nomorTeleponController;
  late TextEditingController passwordController;
  var pilihanPengguna = 0.obs;
  List<String> jenisPengguna = ["Usaha", "Pelamar"];

  register(
    int userType,
    String nama,
    String email,
    String nomorHp,
    String password,
  ) async {
    try {
      if (!userType.isNaN &&
          nama.isNotEmpty &&
          email.isNotEmpty &&
          nomorHp.isNotEmpty &&
          password.isNotEmpty) {
        this.loading.value = true;
        var dataResponse = await dio
            .post("http://jobfair.lentera-lipuku.com/api/auth/register", data: {
          "user_type": userType,
          "nama": nama,
          "email": email,
          "no_hp": nomorHp,
          "password": password,
        });
        loading.value = false;
        print("Register Berhasil");
        print(dataResponse);
        await successSnackBar(
            title: "REGISTRASI BERHASIL",
            message: "Mulai pengalaman kamu di aplikasi kami");
        Get.offAllNamed(Routes.LOGIN);
      } else {
        loading.value = false;
        errorSnackBar(
            title: "REGISTRASI GAGAL",
            message: "Silahkan periksa kembali data kamu");
        print("Register Gagal");
      }
    } on DioError catch (exception) {
      loading.value = false;
      print(exception.response);
      errorSnackBar(
          title: "REGISTRASI GAGAL",
          message: "Silahkan periksa kembali data kamu");
    }
  }

  @override
  void onInit() {
    usernameController = new TextEditingController();
    emailController = new TextEditingController();
    nomorTeleponController = new TextEditingController();
    passwordController = new TextEditingController();
    print("DIBUAT");
    super.onInit();
  }

  @override
  void onClose() {
    usernameController.clear();
    emailController.clear();
    nomorTeleponController.clear();
    passwordController.clear();
    dio.close();
    print("TUTUP");
    super.onClose();
  }
}
