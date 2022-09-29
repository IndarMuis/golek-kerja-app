import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/job_history/views/widgets/job_history_card.dart';
import 'package:lokerku/app/theme.dart';
import '../controllers/job_history_controller.dart';

class JobHistoryView extends GetView<JobHistoryController> {
  var c = Get.put(JobHistoryController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.isLoading.isTrue)
        ? Center(
            child: CircularProgressIndicator(
            color: primaryColor,
          ))
        : (controller.riwayatLowongan.isEmpty)
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(defaultMargin),
                  child: Text(
                    "Anda belum pernah membuat lowongan",
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                      color: Colors.black38,
                    ),
                  ),
                ),
              )
            : ListView(
                children: c.riwayatLowongan.map((e) {
                  return JobHistoryCard(
                    namaToko: e['nama_toko'],
                    gambar: e['gambar'] ?? "assets/gambar1.png",
                    lowongan: e['posisi'],
                    alamat: e['alamat'],
                    tanggal: e['tgl_akhir'],
                  );
                }).toList(),
              ));
  }
}

class Toko {
  String? namaToko, lowongan, alamat, gambar, tanggal;
  Toko({this.namaToko, this.lowongan, this.alamat, this.gambar, this.tanggal});
}
