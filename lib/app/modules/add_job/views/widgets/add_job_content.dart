import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:lokerku/app/modules/add_job/controllers/add_job_controller.dart';
import 'package:lokerku/app/theme.dart';

class AddJobContent extends StatelessWidget {
  AddJobContent({Key? key}) : super(key: key);

  var controller = Get.put(AddJobController());

  @override
  Widget build(BuildContext context) {
    Widget formPosisi() {
      return TextFormField(
        controller: controller.posisi,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Posisi",
        ),
      );
    }

    Widget keahliahKhusus() {
      return TextFormField(
        controller: controller.keahlianKhusus,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Keahlian Khusus",
        ),
      );
    }

    Widget formGaji() {
      return TextFormField(
        keyboardType: TextInputType.number,
        controller: controller.gaji,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Gaji",
        ),
      );
    }

    Widget formJenisKelamin() {
      return DropdownButtonFormField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Jenis Kelamin",
              hintStyle: primaryTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: light,
                  color: Colors.black.withOpacity(0.5))),
          items: controller.jenisKelamin.map((menu) {
            return DropdownMenuItem<String>(
              value: menu,
              child: Text(menu),
            );
          }).toList(),
          onChanged: (value) {
            if (value == "Laki-Laki") {
              controller.pilihanJenisKelamin.value = 1;
            } else {
              controller.pilihanJenisKelamin.value = 2;
            }
            print("Pilihan Pengguna : " +
                controller.pilihanJenisKelamin.value.toString());
          });
    }

    Widget formUmur() {
      return TextFormField(
        keyboardType: TextInputType.number,
        maxLength: 2,
        controller: controller.umur,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Umur",
        ),
      );
    }

    Widget formPendidikan() {
      return DropdownButtonFormField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Pendidikan",
              hintStyle: primaryTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: light,
                  color: Colors.black.withOpacity(0.5))),
          items: controller.pendidikan.map((menu) {
            return DropdownMenuItem<String>(
              value: menu,
              child: Text(menu),
            );
          }).toList(),
          onChanged: (value) {
            controller.pilihanPendidikan.value = value.toString();
            print("Pilihan Pengguna : " +
                controller.pilihanPendidikan.value.toString());
          });
    }

    Widget formDomisili() {
      return TextFormField(
        controller: controller.domisili,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Domisili",
        ),
      );
    }

    return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            formPosisi(),
            SizedBox(
              height: 30,
            ),
            keahliahKhusus(),
            SizedBox(
              height: 30,
            ),
            formGaji(),
            SizedBox(
              height: 30,
            ),
            formJenisKelamin(),
            SizedBox(
              height: 30,
            ),
            formUmur(),
            SizedBox(
              height: 30,
            ),
            formPendidikan(),
            SizedBox(
              height: 30,
            ),
            formDomisili()
          ],
        ));
  }
}
