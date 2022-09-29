import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lokerku/app/modules/register/controllers/register_controller.dart';
import 'package:lokerku/app/modules/register/views/widgets/registrasi_header.dart';

import '../../../../routes/app_pages.dart';
import '../../../../theme.dart';

class RegistrasiProfileForm extends GetView<RegisterController> {
  const RegistrasiProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var jk = ["Laki-laki", "Perempuan"];
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            RegisternHeader(
              title: "Data Diri",
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: 75, left: defaultMargin, right: defaultMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama Lengkap",
                    style: primaryTextStyle.copyWith(
                        fontSize: 20, fontWeight: medium),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Ismunandar Muis",
                        hintStyle: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: light,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Tanggal Lahir",
                    style: primaryTextStyle.copyWith(
                        fontSize: 20, fontWeight: medium),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() => TextField(
                        readOnly: true,
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1960),
                              lastDate: DateTime.now());

                          if (date != null) {
                            print(
                                date); //pickedDate output format => 2021-03-10 00:00:00.000
                            String getDate =
                                DateFormat('dd-MM-yyyy').format(date);
                            // controller.inputTanggalLahir.value = getDate;
                          }
                        },
                        decoration: InputDecoration(
                          hintStyle:
                              primaryTextStyle.copyWith(fontWeight: light),
                          // hintText: controller.inputTanggalLahir.value.isEmpty
                          //     ? 'Tap Here'
                          //     : controller.inputTanggalLahir.value,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Jenis Kelamin",
                    style: primaryTextStyle.copyWith(
                        fontSize: 20, fontWeight: medium),
                  ),
                  SizedBox(
                    height: 10,
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
                    items: ["Laki-laki", "Perempuan"].map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Asal",
                    style: primaryTextStyle.copyWith(
                        fontSize: 20, fontWeight: medium),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Kota Asal",
                        hintStyle: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: light,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.5))),
                    items: [
                      "Makassar",
                      "Jakarta",
                      "Bandung",
                      "Surabaya",
                      "Aceh"
                    ].map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Alamat",
                    style: primaryTextStyle.copyWith(
                        fontSize: 20, fontWeight: medium),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Jln. A.P. Pettarani",
                        hintStyle: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: light,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  SizedBox(height: 50),
                  Container(
                      height: 65,
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: FloatingActionButton(
                          elevation: 0,
                          backgroundColor: secondaryColor,
                          onPressed: () {
                            Get.toNamed(Routes.REGISTER);
                          },
                          child: Icon(
                            Icons.navigate_next_sharp,
                            size: 50,
                            color: backgroundColor,
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
