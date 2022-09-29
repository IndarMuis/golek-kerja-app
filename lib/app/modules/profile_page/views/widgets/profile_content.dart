import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lokerku/app/modules/profile_page/controllers/profile_page_controller.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';
import 'package:get/get.dart';

class ProfileContent extends StatelessWidget {
  var controller = Get.put(ProfilePageController());
  ProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("data profile");
    // print(controller.dataProfie.value["data"]["nama_toko"]);
    return Container(
      margin: EdgeInsets.all(defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: primaryColor,
            radius: 60,
            child: Icon(
              Icons.person,
              size: 100,
              color: backgroundColor,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(defaultMargin),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "${controller.dataProfile.value['data']['email']}",
              style: primaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(defaultMargin),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "${controller.dataProfile.value['data']['no_hp']}",
              style: primaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(defaultMargin),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "${controller.dataProfile.value['data']['nama_toko']}",
              style: primaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(defaultMargin),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "${controller.dataProfile.value['data']['alamat']}",
              style: primaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 30, top: 30),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.PROFILE_USAHA_EDIT,
                            arguments: controller.dataProfile.value);
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          minimumSize: Size(double.infinity, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: secondaryColor,
                          shadowColor: Colors.transparent),
                      child: Text(
                        "Edit Profile",
                        style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                            color: backgroundColor),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: "Log Out",
                          titleStyle: primaryTextStyle.copyWith(
                            fontSize: 25,
                            fontWeight: semiBold,
                          ),
                          titlePadding: EdgeInsets.only(
                              left: 15, right: 15, top: 25, bottom: 15),
                          contentPadding: EdgeInsets.only(
                              left: 15, right: 15, bottom: 25, top: 15),
                          content: Icon(
                            Icons.logout,
                            size: 50,
                            color: Colors.black54,
                          ),
                          confirm: Container(
                            margin: EdgeInsets.all(10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.all(15),
                                primary: errorColor,
                              ),
                              onPressed: () {
                                Get.offAllNamed(Routes.LOGIN);
                              },
                              child: Text("Log Out",
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: medium,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          cancel: Container(
                            margin: EdgeInsets.all(10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                      color: errorColor,
                                    )),
                                padding: EdgeInsets.all(15),
                                primary: Colors.white,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "Cancel",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                  color: errorColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          minimumSize: Size(double.infinity, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: errorColor),
                      child: Text(
                        "Log Out",
                        style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                            color: backgroundColor),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
