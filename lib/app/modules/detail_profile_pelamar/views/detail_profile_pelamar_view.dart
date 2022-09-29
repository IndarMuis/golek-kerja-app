import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

import '../controllers/detail_profile_pelamar_controller.dart';

class DetailProfilePelamarView extends GetView<DetailProfilePelamarController> {
  @override
  Widget build(BuildContext context) {
    print(controller.dataArguments);
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Profile Pelamar",
            style: primaryTextStyle.copyWith(color: backgroundColor),
          ),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: Obx(() => (controller.isLoading.isTrue)
            ? Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : Padding(
                padding: EdgeInsets.all(defaultMargin),
                child: ListView(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: primaryColor,
                        child: Icon(
                          Icons.person,
                          size: 120,
                          color: backgroundColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "${controller.profilePelamar['nama_lengkap']}",
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${controller.profilePelamar['umur']} Tahun",
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          (controller.profilePelamar['jk'] == 1)
                              ? "Laki-laki"
                              : "Perempuan",
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Status Lowongan : ",
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: extraBold,
                                  )),
                              (controller.dataArguments['status_lowongan'] == 1)
                                  ? Text("Diterima",
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: extraBold,
                                        color: successColor,
                                      ))
                                  : (controller.dataArguments[
                                              'status_lowongan'] ==
                                          2)
                                      ? Text("Ditolak",
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 15,
                                            fontWeight: extraBold,
                                            color: errorColor,
                                          ))
                                      : Text("Dalam Proses",
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 15,
                                          )),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 30,
                                color: Colors.black45,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Alamat",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  Text(
                                    "${controller.profilePelamar['alamat']}",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 30,
                                color: Colors.black45,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Kontak",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  Text(
                                    "${controller.profilePelamar['no_hp']}",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Pengalaman Kerja",
                      style: primaryTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    (controller.pengalamanPelamar.length < 0)
                        ? Center(
                            child: Text(
                              "Belum ada pengalaman kerja",
                              style: primaryTextStyle.copyWith(
                                fontSize: 17,
                                fontWeight: medium,
                              ),
                            ),
                          )
                        : Column(
                            children: controller.pengalamanPelamar.map((data) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.workspace_premium_rounded,
                                      size: 50,
                                      color: Colors.black45,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${data['posisi']}",
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 13,
                                              fontWeight: semiBold,
                                            ),
                                          ),
                                          Text(
                                            "${data['nama_perusahaan']}",
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            "Tahun : ${data['tahun']}",
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            "Lokasi : ${data['lokasi']}",
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                  ],
                ),
              )),
        bottomNavigationBar: Container(
          height: 60,
          width: double.infinity,
          margin: EdgeInsets.only(
            bottom: 30,
            left: 25,
            right: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.tolakPelamar();
                },
                child: Text(
                  "Tolak",
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    color: primaryColor,
                    fontWeight: semiBold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                        MediaQuery.of(context).size.width / 2 -
                            2 * defaultMargin,
                        0),
                    primary: backgroundColor,
                    elevation: 0,
                    padding: EdgeInsets.all(defaultMargin),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    side: BorderSide(color: primaryColor, width: 2)),
              ),
              Obx(() => ElevatedButton(
                    onPressed: () {
                      controller.terimaPelamar();
                    },
                    child: (controller.isLoading.isTrue)
                        ? Center(
                            child: CircularProgressIndicator(
                              color: backgroundColor,
                            ),
                          )
                        : Text(
                            "Terima",
                            style: primaryTextStyle.copyWith(
                              fontSize: 18,
                              color: backgroundColor,
                              fontWeight: semiBold,
                            ),
                          ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                          MediaQuery.of(context).size.width / 2 -
                              2 * defaultMargin,
                          0),
                      primary: secondaryColor,
                      elevation: 0,
                      padding: EdgeInsets.all(defaultMargin),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
