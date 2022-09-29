import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';
import '../controllers/saved_page_controller.dart';
import 'widgets/saved_job_card.dart';

class SavedPageView extends GetView<SavedPageController> {
  var controller = Get.put(SavedPageController());
  @override
  Widget build(BuildContext context) {
    print(controller.dataSave.value);
    return Obx(() => (controller.isLoading.value)
        ? Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          )
        : ListView(
            children: controller.dataSave.map((e) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DETAIL_JOB,
                      arguments: {"lowongan_id": e['lowongan_id']});
                },
                child: SavedJobCard(
                  namaToko: e['nama_toko'],
                  gambar: e['img_url'] ?? "assets/gambar1.png",
                  lowongan: e['posisi'],
                  alamat: e['alamat'],
                  tanggal: e['tgl_akhir'],
                  idLowongan: e['lowongan_id'],
                ),
              );
            }).toList(),
          ));
  }
}

class Toko {
  String? namaToko, lowongan, alamat, gambar, tanggal;
  Toko({this.namaToko, this.lowongan, this.alamat, this.gambar, this.tanggal});
}
