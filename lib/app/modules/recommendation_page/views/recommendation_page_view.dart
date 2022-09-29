import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/recommendation_page/views/widgets/recommendation_header.dart';
import 'package:lokerku/app/modules/recommendation_page/views/widgets/recommendation_job_card.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

import '../controllers/recommendation_page_controller.dart';

class RecommendationPageView extends GetView<RecommendationPageController> {
  var c = Get.put(RecommendationPageController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.isLoading.value)
        ? Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          )
        : GridView.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 25 / 40,
            padding: EdgeInsets.all(10),
            children: List<Widget>.generate(
                controller.jumlahData.value,
                (index) => GestureDetector(
                      onTap: () {
                        print(controller.token.value);
                        controller.onClickJob(
                          jumlahKlik: 1,
                          lowonganId: controller.dataLowongan['data'][index]
                              ['id'] as int,
                        );

                        print(controller.dataLowongan['data'][index]['id']);
                      },
                      child: RecommendationJobCard(
                        namaToko: controller.dataLowongan['data'][index]
                            ['nama_toko'],
                        gambar: "assets/gambar1.png",
                        lowongan: controller.dataLowongan['data'][index]
                            ['posisi'],
                        alamat: controller.dataLowongan['data'][index]['alamat']
                            .toString(),
                        tanggal: "Berakhir: " +
                            controller.dataLowongan['data'][index]['tgl_akhir']
                                .toString(),
                        id: controller.dataLowongan['data'][index]['id']
                            .toString(),
                      ),
                    ))));
  }
}

class Toko {
  String? namaToko, lowongan, alamat, gambar, tanggal;
  Toko({this.namaToko, this.lowongan, this.alamat, this.gambar, this.tanggal});
}
