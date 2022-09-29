import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lokerku/app/modules/data_profile/controllers/data_profile_controller.dart';
import 'package:lokerku/app/modules/data_usaha/controllers/data_usaha_controller.dart';
import 'package:lokerku/app/modules/pengalaman/controllers/pengalaman_controller.dart';
import 'package:lokerku/app/theme.dart';

class PengalamanForm extends StatelessWidget {
  PengalamanForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PengalamanController>(
        builder: (controller) => Container(
              margin: EdgeInsets.only(
                  bottom: 40, left: defaultMargin, right: defaultMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.posisiController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Posisi",
                        hintStyle: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: light,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: controller.namaUsahaController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Nama Perusahaan/UMKM",
                        hintStyle: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: light,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: "Jenis Usaha",
                          hintStyle: primaryTextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: light,
                              fontStyle: FontStyle.italic,
                              color: Colors.black.withOpacity(0.5))),
                      items: controller.jenisUsaha.map((menu) {
                        return DropdownMenuItem<String>(
                          value: menu,
                          child: Text(menu),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.pilihanJenisUsaha.value = value.toString();
                      }),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: controller.tahunController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Tahun",
                        hintStyle: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: light,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    maxLines: 3,
                    controller: controller.lokasiController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Lokasi",
                        hintStyle: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: light,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.5))),
                  ),
                ],
              ),
            ));
  }
}
