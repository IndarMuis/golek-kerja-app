import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lokerku/app/modules/detail_job/controllers/detail_job_controller.dart';
import 'package:lokerku/app/theme.dart';

class DetailJobContent extends StatelessWidget {
  const DetailJobContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailJobController>(
        init: DetailJobController(),
        builder: (controller) => Container(
            padding: EdgeInsets.all(defaultMargin),
            margin: EdgeInsets.all(defaultMargin),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Obx(
              () => (controller.isLoading.value)
                  ? Center(
                      child: CircularProgressIndicator(
                      color: primaryColor,
                    ))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage("assets/gambar1.png"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.dataDetailLowongan['nama_toko']}",
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                    Text(
                                      "Ditayangkan pada ${controller.dataDetailLowongan['tgl_mulai'].toString().split("T")[0]}",
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            (controller.lowonganIsSave.value)
                                ? GestureDetector(
                                    onTap: () {
                                      controller.hapusSimpanLowongan();
                                    },
                                    child: Icon(
                                      Icons.bookmark,
                                      size: 30,
                                      color: primaryColor,
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      controller.simpanLowongan();
                                    },
                                    child: Icon(
                                      Icons.bookmark_border_sharp,
                                      size: 30,
                                      color: Colors.grey,
                                    ),
                                  )
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Posisi : ${controller.dataDetailLowongan['posisi']}",
                              style: primaryTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Gaji ${controller.dataDetailLowongan['gaji']}",
                              style: primaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: semiBold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lokasi : ",
                              style: primaryTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "${controller.dataDetailLowongan['alamat_umkm']}",
                              style: primaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: light,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Persyaratan :",
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: semiBold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "1. ${controller.persyaratan['domisili']}",
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "2. ${controller.persyaratan['jk'] == 1 ? 'Laki-Laki' : 'Perempuan'}",
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "3. ${controller.persyaratan['keahlian']}",
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "4. ${controller.persyaratan['lainnya']}",
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "5. Umur ${controller.persyaratan['umur']} Tahun",
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Deskripsi Pekerjaan :",
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: semiBold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: controller.deskripsi
                              .map((element) => Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "- ${element['Deskpisi_lowongan']}",
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
            )));
  }
}
