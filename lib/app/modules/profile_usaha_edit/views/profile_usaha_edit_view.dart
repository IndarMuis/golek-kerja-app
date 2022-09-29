import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lokerku/app/modules/profile_usaha_edit/controllers/profile_usaha_edit_controller.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

class ProfileUsahaEditView extends GetView<ProfileUsahaEditController> {
  ProfileUsahaEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget formEmail() {
      return TextFormField(
        controller: controller.emailController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "${controller.dataUsaha['data']['email']}",
        ),
      );
    }

    Widget formAlamat() {
      return TextFormField(
        minLines: 5,
        maxLines: 5,
        controller: controller.alamatUsahaController,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: "${controller.dataUsaha['data']['alamat']}",
            hintStyle: primaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: light,
                fontStyle: FontStyle.italic,
                color: Colors.black.withOpacity(0.5))),
      );
    }

    Widget formNamaUsaha() {
      return TextFormField(
        controller: controller.namaUsahaController,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: "${controller.dataUsaha['data']['nama_toko']}",
            hintStyle: primaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: light,
                fontStyle: FontStyle.italic,
                color: Colors.black.withOpacity(0.5))),
      );
    }

    Widget formJenisUsaha() {
      return DropdownButtonFormField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              hintText: "${controller.dataUsaha['data']['jenis_usaha']}",
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
          });
    }

    Widget formTahunUsahaBerdiri() {
      return Obx(() => TextFormField(
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                initialDatePickerMode: DatePickerMode.year,
                helpText: "Tahun Usaha Berdiri",
              );
              if (pickedDate != null) {
                controller.tahunUsahaBerdiri.value =
                    DateFormat("yyyy").format(pickedDate);
                print(pickedDate);
              } else {
                print("No selected date");
              }
            },
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: (controller.tahunUsahaBerdiri.value == "")
                    ? "${controller.dataUsaha['data']['tahun_berdiri']}"
                    : controller.tahunUsahaBerdiri.value,
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
          hintText: "${controller.dataUsaha['data']['no_hp']}",
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
              formNamaUsaha(),
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
              formJenisUsaha(),
              SizedBox(
                height: 25,
              ),
              formTahunUsahaBerdiri(),
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
                        controller.saveEditUsahaProfile();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          minimumSize: Size(double.infinity, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: secondaryColor,
                          shadowColor: Colors.transparent),
                      child: (controller.loading.value)
                          ? Center(
                              child: CircularProgressIndicator(
                              color: backgroundColor,
                            ))
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
                        Get.back();
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
