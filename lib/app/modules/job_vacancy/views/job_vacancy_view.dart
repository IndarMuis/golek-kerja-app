import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/job_vacancy/controllers/job_vacancy_controller.dart';
import 'package:lokerku/app/modules/main_page/views/main_page_vacancy.dart';
import 'package:lokerku/app/theme.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class JobVacancyView extends GetView<JobVacancyController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: PersistentTabView(
          context,
          navBarHeight: 75,
          screens: [
            // RecommendationPageView(),
            MainPageVacancy(),
            Center(
              child: Text("Pelamar"),
            )
          ],
          items: [
            PersistentBottomNavBarItem(
              icon: Icon(Icons.home),
              title: ("Utama"),
              iconSize: 35,
              textStyle:
                  primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
              activeColorPrimary: primaryColor,
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              icon: Icon(Icons.person),
              title: ("Saya"),
              iconSize: 35,
              textStyle:
                  primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
              activeColorPrimary: primaryColor,
              inactiveColorPrimary: Colors.grey,
            ),
          ],
          navBarStyle: NavBarStyle.style6,
        ),
      ),
    );
  }
}
