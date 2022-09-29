import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lokerku/app/modules/data_usaha/controllers/data_usaha_controller.dart';
import 'package:lokerku/app/theme.dart';

class DataUsahaForm extends StatelessWidget {
  DataUsahaForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataUsahaController>(
        builder: (controller) => Container(
              margin: EdgeInsets.only(
                  bottom: 75, left: defaultMargin, right: defaultMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.namaUsahaController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Nama Usaha/UMKM",
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
                    controller: controller.tahunBerdiriController,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Tahun Berdiri",
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: Colors.black.withOpacity(0.5),
                        ),
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
                    minLines: 5,
                    maxLines: 5,
                    controller: controller.alamatUsahaController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Alamat",
                        hintStyle: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: light,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  SizedBox(height: 50),
                  Obx(() => Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: secondaryColor,
                                shape: StadiumBorder()),
                            onPressed: () {
                              controller.saveDataUsaha(
                                  controller.namaUsahaController.text,
                                  controller.pilihanJenisUsaha.value,
                                  controller.tahunBerdiriController.text,
                                  controller.alamatUsahaController.text);
                            },
                            child: (!controller.loading.value)
                                ? Text(
                                    "Selesai",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 23,
                                      fontWeight: medium,
                                      color: backgroundColor,
                                    ),
                                  )
                                : CircularProgressIndicator(
                                    color: backgroundColor,
                                  )),
                      )),
                ],
              ),
            ));
  }
}
