import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lokerku/app/helper/notifications.dart';

import '../../../routes/app_pages.dart';

class AddJobController extends GetxController {
  var pilihanJenisKelamin = 0.obs;
  List<String> jenisKelamin = ["Laki-Laki", "Perempuan"];

  var pilihanPendidikan = "0".obs;
  List<String> pendidikan = ["SD", "SMP", "SMA", "S1"];

  RxList<dynamic> controllerDeskripsi = [].obs;
  RxList<dynamic> textFieldDeskripsi = [].obs;

  late TextEditingController posisi;
  late TextEditingController keahlianKhusus;
  late TextEditingController gaji;
  late TextEditingController umur;
  late TextEditingController deskripsi;
  late TextEditingController lainnya;
  late TextEditingController tanggalMulai;
  late TextEditingController tanggalBerakhir;
  late TextEditingController domisili;

  var isLoading = false.obs;
  Dio dio = new Dio();
  var token = "".obs;

  generateInputField(inputController) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: inputController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Deskripsi",
        ),
      ),
    );
  }

  addInputField(context) {
    final inputController = TextEditingController();
    final inputField = generateInputField(inputController);

    controllerDeskripsi.add(inputController);
    textFieldDeskripsi.add(inputField);
  }

  addJob() async {
    List<String> deskripsi = [];
    controllerDeskripsi.forEach((element) {
      print(element.value.text);
      deskripsi.add(element.value.text);
    });
    print(tanggalMulai.text);
    print(tanggalBerakhir.text);
    isLoading.value = true;
    try {
      var data = await dio.post(
        "http://jobfair.lentera-lipuku.com/api/umkm/lowongan/add",
        data: {
          "posisi": posisi.text,
          "gaji": gaji.text.toString(),
          "tgl_mulai": tanggalMulai.text,
          "tgl_akhir": tanggalBerakhir.text,
          "deskripsi": deskripsi,
          "jk": pilihanJenisKelamin.value.toString(),
          "umur": int.parse(umur.text),
          "pendidikan": pilihanPendidikan.value,
          "domisili": domisili.text,
          "keahlian": keahlianKhusus.text,
          "lainnya": lainnya.text,
        },
        options: Options(headers: {"authorization": "Bearer ${token.value}"}),
      );
      successSnackBar(
          title: "DATA DISIMPAN", message: "Berhasi menyimpan data");
      print(data.data);
      Get.offAllNamed(Routes.HOME);
      print("Berhasil");
      print(data.data);
      isLoading.value = false;
    } on DioError catch (e) {
      isLoading.value = false;
      errorSnackBar(
          title: "GAGAL MENAMBAHKAN LOWONGAN",
          message: "Silahkan periksa kembali inputan kamu");
    } catch (e) {
      isLoading.value = false;
      errorSnackBar(
          title: "GAGAL MENAMBAHKAN LOWONGAN",
          message: "Silahkan periksa kembali inputan kamu");
    }
  }

  @override
  void onInit() {
    posisi = new TextEditingController();
    deskripsi = new TextEditingController();
    lainnya = new TextEditingController();
    gaji = new TextEditingController();
    keahlianKhusus = new TextEditingController();
    umur = new TextEditingController();
    domisili = new TextEditingController();
    tanggalMulai = new TextEditingController();
    tanggalBerakhir = new TextEditingController();
    final inputController = new TextEditingController();
    final inputField = generateInputField(inputController);

    controllerDeskripsi.add(inputController);
    textFieldDeskripsi.add(inputField);

    var box = GetStorage();
    token.value = box.read("token");
    print("Mendapatkan token" + token.value);
    super.onInit();
  }

  @override
  void onClose() {
    posisi.dispose();
    deskripsi.dispose();
    lainnya.dispose();
    tanggalBerakhir.dispose();
    tanggalMulai.dispose();
    keahlianKhusus.dispose();
    umur.dispose();
    gaji.dispose();
    domisili.dispose();

    super.onClose();
  }
}
