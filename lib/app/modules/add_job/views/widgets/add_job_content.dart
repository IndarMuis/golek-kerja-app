import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lokerku/app/modules/add_job/controllers/add_job_controller.dart';
import 'package:lokerku/app/theme.dart';

class AddJobContent extends StatelessWidget {
  AddJobContent({Key? key}) : super(key: key);

  var controller = Get.put(AddJobController());

  @override
  Widget build(BuildContext context) {
    Widget formPosisi() {
      return TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Posisi",
        ),
      );
    }

    Widget formPersyaratan() {
      return TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Posisi",
        ),
      );
    }

    Widget formGaji() {
      return TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Gaji",
        ),
      );
    }

    Widget formTanggal() {
      return Obx(() => TextField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: controller.tanggal.value.isEmpty
                    ? "Batas Waktu"
                    : controller.tanggal.value,
                suffixIcon: Icon(Icons.date_range)),
            readOnly: true,
            onChanged: (value) {
              controller.tanggal.value = value;
            },
            onTap: () async {
              DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );

              if (date != null) {
                // print(date);
                String getDate = DateFormat("dd-MM-yyyy").format(date);
                controller.tanggal.value = getDate;
                print(controller.tanggal.value);
              } else {}
            },
          ));
    }

    Widget formDescription() {
      return TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "Deskripsi"),
        maxLines: 6,
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
            formPersyaratan(),
            SizedBox(
              height: 30,
            ),
            formGaji(),
            SizedBox(
              height: 30,
            ),
            formTanggal(),
            SizedBox(
              height: 30,
            ),
            formDescription(),
          ],
        ));
  }
}
