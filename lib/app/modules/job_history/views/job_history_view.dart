import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/job_history/views/widgets/job_history_card.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import '../controllers/job_history_controller.dart';

class JobHistoryView extends GetView<JobHistoryController> {
  // var c = Get.put(RecommendationPageController());
  @override
  Widget build(BuildContext context) {
    var list_of_job = [
      Toko(
          namaToko: "Bumdesa Tuah Baru",
          lowongan: "Kasir",
          alamat: "Selatbaru",
          gambar: "assets/gambar1.png",
          tanggal: "28 Oktober 2021"),
      Toko(
          namaToko: "Toga Mart",
          lowongan: "Sales",
          alamat: "Veteran Selatan",
          gambar: "assets/gambar2.png",
          tanggal: "28 Oktober 2021"),
      Toko(
          namaToko: "Bumdesa Tuah Baru",
          lowongan: "Kasir",
          alamat: "Selatbaru",
          gambar: "assets/gambar1.png",
          tanggal: "28 Oktober 2021"),
      Toko(
          namaToko: "Toga Mart",
          lowongan: "Sales",
          alamat: "Veteran Selatan",
          gambar: "assets/gambar2.png",
          tanggal: "28 Oktober 2021"),
      Toko(
          namaToko: "Bumdesa Tuah Baru",
          lowongan: "Kasir",
          alamat: "Selatbaru",
          gambar: "assets/gambar1.png",
          tanggal: "28 Oktober 2021"),
      Toko(
          namaToko: "Toga Mart",
          lowongan: "Sales",
          alamat: "Veteran Selatan",
          gambar: "assets/gambar2.png",
          tanggal: "28 Oktober 2021"),
      Toko(
          namaToko: "Bumdesa Tuah Baru",
          lowongan: "Kasir",
          alamat: "Selatbaru",
          gambar: "assets/gambar1.png",
          tanggal: "28 Oktober 2021"),
      Toko(
          namaToko: "Toga Mart",
          lowongan: "Sales",
          alamat: "Veteran Selatan",
          gambar: "assets/gambar2.png",
          tanggal: "28 Oktober 2021"),
    ];
    return ListView(
      children: list_of_job.map((e) {
        return JobHistoryCard(
          namaToko: e.namaToko,
          gambar: e.gambar,
          lowongan: e.lowongan,
          alamat: e.alamat, 
          tanggal: e.tanggal,
        );
      } ).toList(),
    );
  }
}

class Toko {
  String? namaToko, lowongan, alamat, gambar, tanggal;
  Toko({this.namaToko, this.lowongan, this.alamat, this.gambar, this.tanggal});
}
