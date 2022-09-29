import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lokerku/app/modules/add_job/controllers/add_job_controller.dart';
import 'package:lokerku/app/theme.dart';

class ContinuedAddJobContent extends StatelessWidget {
  ContinuedAddJobContent({Key? key}) : super(key: key);

  var controller = Get.put(AddJobController());

  @override
  Widget build(BuildContext context) {
    Widget formTanggalMulai() {
      return TextField(
        controller: controller.tanggalMulai,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "Tanggal Mulai",
            suffixIcon: Icon(Icons.date_range)),
        readOnly: true,
        onChanged: (value) {
          controller.tanggalMulai.text = value;
        },
        onTap: () async {
          DateTime? date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025),
          );

          if (date != null) {
            // print(date);
            String getDate = DateFormat().format(date);
            controller.tanggalMulai.text = getDate;
          } else {}
        },
      );
    }

    Widget formTanggalBerakhir() {
      return TextField(
        controller: controller.tanggalBerakhir,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "Tanggal Berakhir",
            suffixIcon: Icon(Icons.date_range)),
        readOnly: true,
        onChanged: (value) {
          controller.tanggalBerakhir.text = value;
        },
        onTap: () async {
          DateTime? date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025),
          );

          if (date != null) {
            // print(date);
            String getDate = DateFormat().format(date);
            controller.tanggalBerakhir.text = getDate;
          } else {}
        },
      );
    }

    Widget formLainnya() {
      return TextFormField(
        controller: controller.lainnya,
        maxLines: 5,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Lainnya",
        ),
      );
    }

    return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            formTanggalMulai(),
            SizedBox(
              height: 30,
            ),
            formTanggalBerakhir(),
            SizedBox(
              height: 30,
            ),
            Obx(() => ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: controller.controllerDeskripsi.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: controller.textFieldDeskripsi.elementAt(index),
                        ),
                      ),
                      (controller.controllerDeskripsi.length == 1)
                          ? SizedBox()
                          : Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {
                                    controller.controllerDeskripsi
                                        .removeAt(index);
                                    controller.textFieldDeskripsi
                                        .removeAt(index);
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: errorColor,
                                  )))
                    ],
                  );
                })),
            Obx(() => (controller.controllerDeskripsi.length >= 3)
                ? SizedBox()
                : Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                          controller.addInputField(context);
                        },
                        child: Text(
                          "+Tambah Deskripsi",
                          style: primaryTextStyle.copyWith(
                            color: primaryColor,
                            fontWeight: semiBold,
                          ),
                        )),
                  )),
            SizedBox(
              height: 30,
            ),
            formLainnya()
          ],
        ));
  }
}
