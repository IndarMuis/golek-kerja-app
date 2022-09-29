import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lokerku/app/routes/app_pages.dart';

class SavedPageController extends GetxController {
  Dio dio = new Dio();
  var token = "".obs;
  var userType = 0.obs;
  var isLoading = false.obs;

  var dataSave = [].obs;

  void hapusSimpanLowongan({int? idLowongan}) async {
    isLoading.value = true;
    try {
      await dio.post(
        "http://jobfair.lentera-lipuku.com/api/user/save-lowongan",
        data: {
          "lowongan_id": idLowongan,
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

  @override
  void onInit() async {
    isLoading.value = true;

    var box = GetStorage();
    token.value = box.read("token");
    userType.value = box.read("user_type");

    print(userType.value);

    if (userType == 2) {
      try {
        var response = await dio.get(
            "http://jobfair.lentera-lipuku.com/api/umkm/saved",
            options:
                Options(headers: {"authorization": "bearer ${token.value}"}));
        List<dynamic> data = await response.data['data'];
        data.forEach((element) {
          if (element['saved'] == 1) {
            dataSave.add(element);
          }
        });
        print(dataSave);
      } on DioError catch (e) {
        print(e.response);
        print(e.message);
        print(e.error);
      }
    }

    isLoading.value = false;
    super.onInit();
  }

  @override
  void onClose() {}
}
