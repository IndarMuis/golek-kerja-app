import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/main_page/views/main_page_vacancy.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

import '../controllers/daftar_pelamar_controller.dart';

class DaftarPelamarView extends GetView<DaftarPelamarController> {
  var controller = Get.put(DaftarPelamarController());

  @override
  Widget build(BuildContext context) {
    Widget pelamarCard(
        {String? namaLengkap,
        String? alamat,
        String? noHp,
        String? waktuDaftar,
        String? imgUrl,
        int? status}) {
      return Container(
        padding: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama : ${namaLengkap}",
                    style: primaryTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: semiBold,
                      color: backgroundColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Alamat : ${alamat}",
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      color: backgroundColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Nomor Telepon : ${noHp}",
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      color: backgroundColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Tanggal Daftar : ${waktuDaftar}",
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      color: backgroundColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  (status == 1)
                      ? Text(
                          "Status : Diterima",
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            color: backgroundColor,
                            fontWeight: bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      : (status == 2)
                          ? Text(
                              "Status : Ditolak",
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                                color: backgroundColor,
                                fontWeight: bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          : Text(
                              "Status : Dalam Proses",
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                                color: backgroundColor,
                                fontWeight: bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 40,
              backgroundColor: backgroundColor,
              child: CircleAvatar(
                radius: 37,
                backgroundColor: primaryColor,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: backgroundColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Obx(() => (controller.isLoading.isTrue)
        ? Center(
            child: CircularProgressIndicator(
            color: primaryColor,
          ))
        : (controller.daftarPelamar.isEmpty)
            ? Center(
                child: Text(
                  "Belum ada pelamar saat ini",
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
              )
            : ListView(
                children: controller.daftarPelamar.map((e) {
                  print(controller.daftarPelamar);
                  var waktuDaftar = e['waktu_daftar'].toString().split("T")[0];
                  return Container(
                    margin: EdgeInsets.only(
                        left: defaultMargin,
                        right: defaultMargin,
                        bottom: 10,
                        top: defaultMargin),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_PROFILE_PELAMAR, arguments: {
                          "pelamar_id": e['pelamar_id'],
                          "daftar_lowongan_id": e['daftar_lowongan_id'],
                          "umkm_id": e['lowongan_id'],
                          "status_lowongan": e['status_lowongan'],
                        });
                      },
                      child: pelamarCard(
                        namaLengkap: e['nama_lengkap'],
                        alamat: e['alamat'],
                        noHp: e['no_hp'],
                        waktuDaftar: waktuDaftar,
                        status: e['status_lowongan'],
                      ),
                    ),
                  );
                }).toList(),
              ));
  }
}
