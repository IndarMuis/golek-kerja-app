import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lokerku/app/routes/app_pages.dart';

class ProfilePageController extends GetxController {
  Dio dio = new Dio();
  var isLoading = false.obs;
  var dataProfile = {}.obs;

  List<String> jenisKelamin = ["Laki-Laki", "Perempuan"];
  var pilihanJenisKelamin = "".obs;

  var tanggalLahir = "".obs;

  late TextEditingController namaLengkapController;
  late TextEditingController alamatController;
  late TextEditingController umurController;
  late TextEditingController usernameController;
  late TextEditingController nomorController;
  late TextEditingController emailController;

  RxString token = "".obs;
  var userType = 0.obs;
  var valid = false.obs;
  var response;

  var _picker = ImagePicker();
  File? imageFile;

  void saveEditPelamarProfile() async {
    isLoading.value = true;
    try {
      var data = await dio.put(
        "http://jobfair.lentera-lipuku.com/api/user/profil/pelamar/edit",
        data: {
          "nama_lengkap": (namaLengkapController.text.isEmpty)
              ? dataProfile['data']['nama_lengkap']
              : namaLengkapController.text,
          "tgl_lahir": (tanggalLahir.value.isEmpty)
              ? dataProfile['data']['tgl_lahir']
              : tanggalLahir.value,
          "umur": (umurController.text.isEmpty)
              ? dataProfile['data']['umur']
              : int.parse(umurController.text),
          "email": (emailController.text.isEmpty)
              ? dataProfile['data']['email']
              : emailController.text,
          "no_hp": (nomorController.text.isEmpty)
              ? dataProfile['data']['no_hp']
              : nomorController.text,
          "alamat": (alamatController.text.isEmpty)
              ? dataProfile['data']['alamat']
              : alamatController.text,
          "jk": (pilihanJenisKelamin.value.isEmpty)
              ? dataProfile['data']['jk']
              : pilihanJenisKelamin.value,
        },
        options: Options(
          headers: {
            "authorization": "bearer ${token.value}",
          },
        ),
      );
      isLoading.value = false;
      Get.offAllNamed(Routes.HOME);
    } on DioError catch (e) {
      print(e.response);
      isLoading.value = false;
      print(e.error);
    }
  }

  Future<void> getImageFromGallery() async {
    XFile? _pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      imageFile = File(_pickedFile.path);
    }
  }

  Future<void> uploadImage() async {
    try {
      XFile? _pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (_pickedFile != null) {
        imageFile = await File(_pickedFile.path);
      }

      String fileName = imageFile!.path.split("/").last;
      var formData = FormData.fromMap(
        {
          "file": await MultipartFile.fromFile(
            _pickedFile!.path,
            filename: fileName,
          ),
        },
      );

      response = await dio.post(
          "http://jobfair.lentera-lipuku.com/api/user/profil/upload",
          data: {"img_profil": formData},
          options: Options(headers: {
            "authorization": "bearer ${token.value}",
          }));
    } on DioError catch (e) {
      print(e.response);
      print(e.message);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<File> getImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    File file = File(image!.path);
    return file;
  }

  @override
  void onInit() async {
    namaLengkapController = new TextEditingController();
    alamatController = new TextEditingController();
    umurController = new TextEditingController();
    usernameController = new TextEditingController();
    nomorController = new TextEditingController();
    emailController = new TextEditingController();

    isLoading.value = true;
    print("PROFILE");
    final box = GetStorage();
    token.value = box.read("token");
    userType.value = box.read("user_type");

    var data = (userType.value == 1)
        ? await Dio().get(
            "http://jobfair.lentera-lipuku.com/api/user/profil/umkm",
            options:
                Options(headers: {"authorization": "bearer ${token.value}"}))
        : await Dio().get(
            "http://jobfair.lentera-lipuku.com/api/user/profil/pelamar",
            options:
                Options(headers: {"authorization": "bearer ${token.value}"}));
    dataProfile.value = await data.data;
    print(dataProfile.value);
    isLoading.value = false;
    super.onInit();
  }
}
