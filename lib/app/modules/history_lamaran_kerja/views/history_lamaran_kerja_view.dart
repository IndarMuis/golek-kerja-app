import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/history_lamaran_kerja/views/widgets/history_lamaran_kerja_header.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

import '../controllers/history_lamaran_kerja_controller.dart';

class HistoryLamaranKerjaView extends GetView<HistoryLamaranKerjaController> {
  // var controller = Get.put(HistoryLamaranKerjaController());
  @override
  Widget build(BuildContext context) {
    print(controller.dataLamaran);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            HistoryLamaranKerjaHeader(),
            Padding(
              padding: EdgeInsets.all(defaultMargin),
              child: Obx(() => (controller.isLoading.isTrue)
                  ? Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: controller.dataLamaran.map((element) {
                        var waktuDaftar =
                            element['waktu_daftar'].toString().split("T")[0];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.DETAIL_JOB, arguments: {
                              "lowongan_id": element['lowongan_id'],
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      (element['status'] == 1)
                                          ? Text("Status: Diterima",
                                              style: primaryTextStyle.copyWith(
                                                fontSize: 15,
                                                fontWeight: semiBold,
                                                color: successColor,
                                              ))
                                          : (element['status'] == 2)
                                              ? Text("Status: Ditolak",
                                                  style:
                                                      primaryTextStyle.copyWith(
                                                    fontSize: 15,
                                                    fontWeight: semiBold,
                                                    color: errorColor,
                                                  ))
                                              : Text("Status: Dalam Proses",
                                                  style:
                                                      primaryTextStyle.copyWith(
                                                    fontSize: 15,
                                                    fontWeight: semiBold,
                                                  )),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Nama toko: ${element['nama_toko']}",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                      Text(
                                        "Alamat: ${element['alamat']}",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        "Posisi: ${element['posisi']}",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Waktu Daftar: $waktuDaftar",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: primaryColor,
                                  radius: 40,
                                  child: Icon(
                                    Icons.workspace_premium_outlined,
                                    size: 50,
                                    color: backgroundColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    )),
            ),
          ],
        ),
      ),
    );
  }
}
