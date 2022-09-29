import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/data_usaha/views/widgets/data_usaha_header.dart';
import 'package:lokerku/app/modules/pengalaman/views/widgets/pengalaman_form.dart';
import 'package:lokerku/app/modules/pengalaman/views/widgets/pengalaman_header.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

import '../controllers/pengalaman_controller.dart';

class PengalamanView extends StatelessWidget {
  var controller = Get.put(PengalamanController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: ListView(
            children: [
              PengalamanHeader(),
              SizedBox(
                height: 10,
              ),
              PengalamanForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await Get.defaultDialog(
                        confirm: Obx(() => Container(
                              margin: EdgeInsets.only(
                                left: defaultMargin,
                                top: defaultMargin,
                                bottom: 10,
                              ),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(15),
                                    primary: secondaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  onPressed: () {
                                    controller.saveDataPengalaman();
                                  },
                                  child: (controller.loading.value)
                                      ? SizedBox(
                                          height: 10,
                                          width: 10,
                                          child: CircularProgressIndicator(
                                            color: backgroundColor,
                                          ),
                                        )
                                      : Text(
                                          "Simpan",
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 15,
                                            color: backgroundColor,
                                          ),
                                        )),
                            )),
                        cancel: Container(
                          margin: EdgeInsets.only(
                            right: defaultMargin,
                            top: defaultMargin,
                            bottom: 10,
                          ),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(15),
                                  primary: errorColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text("Batal")),
                        ),
                        title: "Simpan Data Pengalaman",
                        titlePadding: EdgeInsets.only(
                          top: defaultMargin,
                          left: defaultMargin,
                          right: defaultMargin,
                        ),
                        contentPadding: EdgeInsets.all(defaultMargin),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Posisi: ${controller.posisiController.text}",
                              style: primaryTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: medium,
                              ),
                              textAlign: TextAlign.justify,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Perusahaan: ${controller.namaUsahaController.text}",
                              style: primaryTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: medium,
                              ),
                              textAlign: TextAlign.justify,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Jenis Usaha: ${controller.pilihanJenisUsaha.value}",
                              style: primaryTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: medium,
                              ),
                              textAlign: TextAlign.justify,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Tahun: ${controller.tahunController.text}",
                              style: primaryTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: medium,
                              ),
                              textAlign: TextAlign.justify,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Lokasi Usaha: ${controller.lokasiController.text}",
                              style: primaryTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: medium,
                              ),
                              textAlign: TextAlign.justify,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "Simpan Pengalaman",
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, color: backgroundColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(Routes.HOME);
                    },
                    child: Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        "Selesai",
                        style: primaryTextStyle.copyWith(
                            fontSize: 20, color: backgroundColor),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // TextButton(
              //     onPressed: () {},
              //     child: Text(
              //       "Skip >>",
              //       style: primaryTextStyle.copyWith(
              //         fontSize: 18,
              //         color: secondaryColor,
              //       ),
              //     )),
              SizedBox(
                height: 30,
              ),
            ],
          )),
    );
  }
}
