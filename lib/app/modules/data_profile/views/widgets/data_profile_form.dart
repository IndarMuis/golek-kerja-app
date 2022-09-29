import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lokerku/app/modules/data_profile/controllers/data_profile_controller.dart';
import 'package:lokerku/app/modules/data_usaha/controllers/data_usaha_controller.dart';
import 'package:lokerku/app/theme.dart';

class DataProfileForm extends StatelessWidget {
  DataProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataProfileController>(
        builder: (controller) => Container(
              margin: EdgeInsets.only(
                  bottom: 75, left: defaultMargin, right: defaultMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.namaLengkapController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Nama Lengkap",
                        hintStyle: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: light,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Obx(() => TextFormField(
                        controller: controller.tanggalLahirController,
                        readOnly: true,
                        onChanged: (value) {
                          controller.tanggalLahirController.text = value;
                        },
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1990),
                            lastDate: DateTime.now(),
                            helpText: "Tanggal Lahir",
                          );
                          if (pickedDate != null) {
                            // print(date);
                            String getDate = DateFormat().format(pickedDate);
                            controller.tanggalLahirController.text = getDate;
                          } else {}
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: (controller.tanggalLahir.value == "")
                                ? "Tanggal Lahir"
                                : controller.tanggalLahir.value,
                            suffixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            hintStyle: primaryTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: light,
                                fontStyle: FontStyle.italic,
                                color: Colors.black.withOpacity(0.5))),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: controller.umurController,
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Umur",
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
                          hintText: "Jenis Kelamin",
                          hintStyle: primaryTextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: light,
                              fontStyle: FontStyle.italic,
                              color: Colors.black.withOpacity(0.5))),
                      items: controller.jenisKelamin.map((menu) {
                        return DropdownMenuItem<String>(
                          value: menu,
                          child: Text(menu),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value == "Laki-Laki") {
                          controller.pilihanJenisKelamin.value = "1";
                        } else {
                          controller.pilihanJenisKelamin.value = "2";
                        }
                      }),
                  SizedBox(
                    height: 25,
                  ),
                  // DropdownButtonFormField(
                  //     decoration: InputDecoration(
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(15)),
                  //         hintText: "Pendidikan Terakhir",
                  //         hintStyle: primaryTextStyle.copyWith(
                  //             fontSize: 15,
                  //             fontWeight: light,
                  //             fontStyle: FontStyle.italic,
                  //             color: Colors.black.withOpacity(0.5))),
                  //     items: controller.pendidikanTerakhir.map((menu) {
                  //       return DropdownMenuItem<String>(
                  //         value: menu,
                  //         child: Text(menu),
                  //       );
                  //     }).toList(),
                  //     onChanged: (value) {
                  //       controller.pilihanPendidikanTerakhir.value =
                  //           value.toString();
                  //     }),
                  // SizedBox(
                  //   height: 25,
                  // ),
                  TextFormField(
                    minLines: 5,
                    maxLines: 5,
                    controller: controller.alamatController,
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
                              controller.saveDataUsaha();
                            },
                            child: (!controller.loading.value)
                                ? Text(
                                    "Simpan dan Lanjut",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 20,
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
