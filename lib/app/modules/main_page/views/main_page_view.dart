import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/recommendation_page/views/recommendation_page_view.dart';
import 'package:lokerku/app/modules/saved_page/views/saved_page_view.dart';
import 'package:lokerku/app/routes/app_pages.dart';

import '../../../theme.dart';
import '../controllers/main_page_controller.dart';

class MainPageView extends GetView<MainPageController> {
  var controller = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 190,
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
                        "Cari Pekerjaan",
                        style: primaryTextStyle.copyWith(
                          fontSize: 30,
                          fontWeight: semiBold,
                          color: backgroundColor,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.HISTORY_LAMARAN_KERJA);
                        },
                        icon: Icon(
                          Icons.history,
                          size: 40,
                          color: backgroundColor,
                        ))
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.searchController,
                        decoration: InputDecoration(
                          hintText: "Pencarian",
                          hintStyle: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: light,
                              color: Colors.black.withOpacity(0.5)),
                          contentPadding: EdgeInsets.all(13),
                          focusColor: backgroundColor,
                          hoverColor: backgroundColor,
                          disabledBorder: InputBorder.none,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          fillColor: backgroundColor.withOpacity(0.7),
                          filled: true,
                        ),
                        onChanged: (value) {
                          controller.recommendedationPageController
                              .searchLowongan(
                                  keyword: controller.searchController.text);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
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
                        text: "Lowongan",
                      ),
                      Tab(
                        text: "Disimpan",
                      ),
                    ]),
              ),
              Expanded(
                  child: TabBarView(children: [
                RecommendationPageView(),
                SavedPageView(),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
