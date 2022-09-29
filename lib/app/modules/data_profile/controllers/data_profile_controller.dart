import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lokerku/app/helper/notifications.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

class DataProfileController extends GetxController {
  Dio dio = new Dio();
  var loading = false.obs;

  List<String> jenisKelamin = ["Laki-Laki", "Perempuan"];
  var pilihanJenisKelamin = "".obs;

  // List<String> pendidikanTerakhir = ["SD", "SMP", "SMA", "S1"];
  // var pilihanPendidikanTerakhir = "".obs;

  var tanggalLahir = "".obs;

  late TextEditingController namaLengkapController;
  late TextEditingController alamatController;
  late TextEditingController umurController;
  late TextEditingController tanggalLahirController;

  RxString token = "".obs;
  var userType = 0.obs;
  var valid = false.obs;

  saveDataUsaha() async {
    final box = GetStorage();
    try {
      if (namaLengkapController.text.isNotEmpty &&
          tanggalLahirController.text.isNotEmpty &&
          pilihanJenisKelamin.value.isNotEmpty &&
          umurController.text.isNotEmpty) {
        loading.value = true;
        var data = await dio.post(
            "http://jobfair.lentera-lipuku.com/api/auth/data-diri/pelamar",
            data: {
              "nama_lengkap": namaLengkapController.text,
              "tgl_lahir": tanggalLahirController.text,
              "jk": int.parse(pilihanJenisKelamin.value),
              "umur": int.parse(umurController.text),
              "alamat": alamatController.text
            },
            options:
                Options(headers: {"Authorization": "Bearer ${token.value}"}));
        print(data.data);
        token.value = data.data['data']['token'];
        print("TOKEN BARU ${token.value}");
        box.write('token', "${token.value}");
        successSnackBar(
            title: "DATA DISIMPAN", message: "Berhasil menyimpan data profile");
        print(data.data);
        loading.value = false;
        Get.offAllNamed(Routes.PENGALAMAN);
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
    namaLengkapController = new TextEditingController();
    alamatController = new TextEditingController();
    umurController = new TextEditingController();
    tanggalLahirController = new TextEditingController();

    print("Get Token");
    final box = GetStorage();
    token.value = box.read("token");
    userType.value = box.read("user_type");
    valid.value = box.read("valid");
    super.onInit();
  }

  @override
  void onClose() async {
    namaLengkapController.dispose();
    alamatController.dispose();
    umurController.dispose();
    tanggalLahirController.dispose();

    dio.close();
    super.onClose();
  }
}
