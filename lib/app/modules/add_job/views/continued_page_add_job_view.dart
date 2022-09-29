import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/add_job/controllers/add_job_controller.dart';
import 'package:lokerku/app/modules/add_job/views/widgets/continued_add_job_content.dart';
import 'package:lokerku/app/routes/app_pages.dart';

import '../../../theme.dart';
import 'widgets/add_job_header.dart';

class ContinuedPageAddJobView extends GetView<AddJobController> {
  // var controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          // shrinkWrap: true,
          children: [
            AddJobHeader(),
            SizedBox(
              height: 20,
            ),
            // AddJobContent(),
            ContinuedAddJobContent(),
            SizedBox(
              height: 50,
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
              bottom: 40),
          decoration: BoxDecoration(
            color: Color(0xffF9F9F9),
            // color: Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.ADD_JOB);
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "Kembali",
                    style: primaryTextStyle.copyWith(
                        fontSize: 20, color: primaryColor),
                  )),
                ),
              ),
              Obx(() => GestureDetector(
                    onTap: () {
                      // print("data disimpan");
                      controller.addJob();
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: (controller.isLoading.value)
                          ? Center(
                              child: CircularProgressIndicator(
                                color: backgroundColor,
                              ),
                            )
                          : Center(
                              child: Text(
                              "Simpan",
                              style: primaryTextStyle.copyWith(
                                  fontSize: 20, color: backgroundColor),
                            )),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
