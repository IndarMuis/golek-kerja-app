import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/detail_job/views/widgets/detail_job_content.dart';
import 'package:lokerku/app/modules/detail_job/views/widgets/detail_job_header.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

import '../controllers/detail_job_controller.dart';

class DetailJobView extends GetView<DetailJobController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          children: [
            DetailJobHeader(),
            SizedBox(
              height: 20,
            ),
            DetailJobContent(),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 38),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  child: Obx(() =>
                      (controller.dataDetailLowongan['status_daftar'] == true)
                          ? ElevatedButton(
                              onPressed: () {
                                Get.toNamed(Routes.HISTORY_LAMARAN_KERJA);
                              },
                              child: (controller.isLoading.value)
                                  ? Center(
                                      child: CircularProgressIndicator(
                                      color: backgroundColor,
                                    ))
                                  : Text(
                                      "Cek Riwayat Lamaran",
                                      style: primaryTextStyle.copyWith(
                                          fontSize: 15,
                                          color: secondaryColor,
                                          fontWeight: semiBold),
                                    ),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: backgroundColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      width: 1.5,
                                      color: secondaryColor,
                                    )),
                                padding: EdgeInsets.symmetric(vertical: 16),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                controller.daftarLowongan();
                              },
                              child: (controller.isLoading.value)
                                  ? Center(
                                      child: CircularProgressIndicator(
                                      color: backgroundColor,
                                    ))
                                  : Text(
                                      "Lamar Sekarang",
                                      style: primaryTextStyle.copyWith(
                                          fontSize: 15,
                                          color: backgroundColor,
                                          fontWeight: medium),
                                    ),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.symmetric(vertical: 16),
                              ),
                            )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
