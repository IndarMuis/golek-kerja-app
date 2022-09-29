import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/daftar_pelamar/views/daftar_pelamar_view.dart';
import 'package:lokerku/app/modules/job_history/views/job_history_view.dart';
import 'package:lokerku/app/modules/recommendation_page/views/recommendation_page_view.dart';
import 'package:lokerku/app/modules/saved_page/views/saved_page_view.dart';
import 'package:lokerku/app/routes/app_pages.dart';

import '../../../theme.dart';
import '../controllers/main_page_controller.dart';

class MainPageVacancy extends GetView<MainPageController> {
  var controller = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          flexibleSpace: Container(
            width: double.infinity,
            color: primaryColor,
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Buka Lowongan",
                        style: primaryTextStyle.copyWith(
                          fontSize: 25,
                          fontWeight: semiBold,
                          color: backgroundColor,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.ADD_JOB);
                        },
                        icon: Icon(
                          Icons.add_to_photos_sharp,
                          size: 35,
                          color: backgroundColor,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Column(
            children: [
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: backgroundColor,
                    border: Border(
                        bottom: BorderSide(width: 0.5, color: Colors.grey))),
                child: TabBar(
                    labelStyle: primaryTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 15),
                    labelColor: primaryColor,
                    unselectedLabelColor: Colors.grey,
                    // controller: tabController,
                    indicator: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      width: 4,
                      color: primaryColor,
                    ))),
                    tabs: [
                      Tab(
                        text: "Riwayat Lowongan",
                      ),
                      Tab(
                        text: "Pelamar",
                      ),
                    ]),
              ),
              Expanded(
                  child: TabBarView(children: [
                JobHistoryView(),
                DaftarPelamarView(),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
