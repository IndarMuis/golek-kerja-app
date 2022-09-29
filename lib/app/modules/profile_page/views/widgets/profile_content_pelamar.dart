import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lokerku/app/modules/profile_page/controllers/profile_page_controller.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';
import 'package:get/get.dart';

class ProfileContentPelamar extends StatelessWidget {
  ProfileContentPelamar({Key? key}) : super(key: key);

  var controller = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              (controller.dataProfile['data']['img_url'] == null)
                  ? CircleAvatar(
                      backgroundColor: primaryColor,
                      radius: 60,
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: backgroundColor,
                      ),
                    )
                  : CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          "${controller.dataProfile['data']['img_url']}"),
                      radius: 60,
                    ),
              Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryColor, width: 2),
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100.0),
                    onTap: () async {
                      Get.defaultDialog(
                          titlePadding: EdgeInsets.all(defaultMargin),
                          contentPadding: EdgeInsets.all(defaultMargin),
                          title: "Foto Profile",
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                  radius: 55,
                                  backgroundColor: Colors.grey.withOpacity(0.5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.camera_alt_outlined,
                                          size: 40, color: Colors.black),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Kamera",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: semiBold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.uploadImage();
                                },
                                child: CircleAvatar(
                                  radius: 55,
                                  backgroundColor: Colors.grey.withOpacity(0.5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image_outlined,
                                        size: 40,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Gallery",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: semiBold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.edit,
                        size: 20.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          // Obx(() => Text("${controller.imageFIle!.name.toString()}")),
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
              "${controller.dataProfile.value['data']['tgl_lahir']}",
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
              (controller.dataProfile.value['data']['jk'] == 1)
                  ? "Laki-Laki"
                  : "Perempuan",
              style: primaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.PENGALAMAN);
              },
              child: Container(
                // width:
                //     MediaQuery.of(context).size.width / 1.6 - 2 * defaultMargin,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: backgroundColor,
                    border: Border.all(
                      width: 2,
                      color: secondaryColor,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 20,
                      color: secondaryColor,
                    ),
                    Text(
                      "Tambah Data Pengalaman",
                      style: primaryTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: semiBold,
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 30, top: 15),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.PROFILE_EDIT);
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
                        // Get.offAllNamed(Routes.LOGIN);
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
