import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lokerku/app/routes/app_pages.dart';

import '../../../theme.dart';

class LoginController extends GetxController {
  late Dio dio;
  var loading = false.obs;
  late TextEditingController emailOrPasswordController;
  late TextEditingController passwordController;

  login(String emailOrPassword, String password) async {
    final box = GetStorage();
    try {
      if (emailOrPassword.isNotEmpty && password.isNotEmpty) {
        loading.value = true;
        var data = await dio.post(
          "http://jobfair.lentera-lipuku.com/api/auth/login",
          data: {
            "emailHp": emailOrPassword,
            "password": password,
          },
        );
        print(data.data);
        var token = data.data['data']['token'];
        var dataValid = data.data['data']['user_valid'];
        var userType = data.data['data']['user_type'];
        box.write('token', "${token}");
        box.write('valid', dataValid);
        box.write('user_type', userType);
        print(token);
        print(dataValid);
        print(userType);

        if (dataValid && userType == 1) {
          loading.value = false;
          Get.offAllNamed(Routes.HOME);
          return;
        } else if (dataValid && userType == 2) {
          loading.value = false;
          Get.offAllNamed(Routes.HOME);
          return;
        } else if (!dataValid && userType == 1) {
          loading.value = false;
          print("DATA USAHA");
          Get.offAllNamed(Routes.DATA_USAHA);
          return;
        } else if (!dataValid && userType == 2) {
          print("DATA USER");
          loading.value = false;
          Get.offAllNamed(Routes.DATA_PROFILE);
          return;
        } else {
          return;
        }
      } else {
        loading.value = false;
        await Get.snackbar(
          "",
          "",
          titleText: Center(
            child: Text(
              "LOGIN GAGAL",
              style: primaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: semiBold,
                color: backgroundColor,
              ),
            ),
          ),
          messageText: Center(
            child: Text(
              "Silahkan Periksa Kembali Data Kamu",
              style: primaryTextStyle.copyWith(
                fontSize: 13,
                color: backgroundColor,
              ),
            ),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: errorColor.withOpacity(0.7),
        );
      }
    } catch (e) {
      loading.value = false;
      print(e.toString());
      await Get.snackbar(
        "",
        "",
        titleText: Center(
          child: Text(
            "LOGIN GAGAL",
            style: primaryTextStyle.copyWith(
              fontSize: 13,
              fontWeight: semiBold,
              color: backgroundColor,
            ),
          ),
        ),
        messageText: Center(
          child: Text(
            "Silahkan Periksa Kembali Data Kamu",
            style: primaryTextStyle.copyWith(
              fontSize: 13,
              color: backgroundColor,
            ),
          ),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: errorColor.withOpacity(0.7),
      );
    }
  }

  @override
  void onInit() {
    emailOrPasswordController = new TextEditingController();
    passwordController = new TextEditingController();
    dio = new Dio();
    super.onInit();
  }

  @override
  void onClose() {
    emailOrPasswordController.clear();
    passwordController.clear();
    super.onClose();
  }
}
