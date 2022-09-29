import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

import '../controllers/profile_page_controller.dart';

class ProfileEditPageView extends StatelessWidget {
  ProfileEditPageView({Key? key}) : super(key: key);
  var controller = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    Widget formEmail() {
      return TextFormField(
        controller: controller.emailController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "${controller.dataProfile['data']['email']}",
        ),
      );
    }

    Widget formAlamat() {
      return TextFormField(
        minLines: 5,
        maxLines: 5,
        controller: controller.alamatController,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: "${controller.dataProfile['data']['alamat']}",
            hintStyle: primaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: light,
                fontStyle: FontStyle.italic,
                color: Colors.black.withOpacity(0.5))),
      );
    }

    Widget formUmur() {
      return TextFormField(
        controller: controller.umurController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: "${controller.dataProfile['data']['umur']}",
            hintStyle: primaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: light,
                fontStyle: FontStyle.italic,
                color: Colors.black.withOpacity(0.5))),
      );
    }

    Widget formJenisKelamin() {
      return DropdownButtonFormField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              hintText: (controller.dataProfile['data']['jk'] == 1)
                  ? "Laki-Laki"
                  : "Perempuan",
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
          });
    }

    Widget formTanggalLahir() {
      return Obx(() => TextFormField(
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                helpText: "Tanggal Lahir",
              );
              if (pickedDate != null) {
                controller.tanggalLahir.value =
                    DateFormat("dd-MM-yyyy").format(pickedDate);
                print(controller.tanggalLahir.value);
              } else {
                print("No selected date");
              }
            },
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: (controller.tanggalLahir.value == "")
                    ? "${controller.dataProfile['data']['tgl_lahir']}"
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
          ));
    }

    Widget formNomor() {
      return TextFormField(
        controller: controller.nomorController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "${controller.dataProfile['data']['no_hp']}",
        ),
      );
    }

    Widget formUsername() {
      return TextFormField(
        controller: controller.namaLengkapController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "${controller.dataProfile['data']['nama_lengkap']}",
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Edit Profile",
            style: primaryTextStyle.copyWith(color: backgroundColor),
          ),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: ListView(
            children: [
              formUsername(),
              SizedBox(
                height: 25,
              ),
              formTanggalLahir(),
              SizedBox(
                height: 25,
              ),
              formUmur(),
              SizedBox(
                height: 25,
              ),
              formJenisKelamin(),
              SizedBox(
                height: 25,
              ),
              formEmail(),
              SizedBox(
                height: 25,
              ),
              formNomor(),
              SizedBox(
                height: 25,
              ),
              formAlamat(),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Obx(() => ElevatedButton(
                      onPressed: () {
                        controller.saveEditPelamarProfile();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          minimumSize: Size(double.infinity, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: secondaryColor,
                          shadowColor: Colors.transparent),
                      child: (controller.isLoading.value)
                          ? Center(
                              child: CircularProgressIndicator(
                                color: backgroundColor,
                              ),
                            )
                          : Text(
                              "Simpan",
                              style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: semiBold,
                                  color: backgroundColor),
                            ))),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed(Routes.HOME);
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          minimumSize: Size(double.infinity, 30),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: primaryColor),
                              borderRadius: BorderRadius.circular(10)),
                          primary: backgroundColor),
                      child: Text(
                        "Batal",
                        style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                            color: primaryColor),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
