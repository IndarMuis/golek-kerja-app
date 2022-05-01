import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/profile_page/views/profile_page_view.dart';
import 'package:lokerku/app/modules/recommendation_page/views/recommendation_page_view.dart';
import 'package:lokerku/app/theme.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: PersistentTabView(
          context,
          navBarHeight: 75,
          screens: [
            RecommendationPageView(),
            ProfilePageView(),
          ],
          items: [
           PersistentBottomNavBarItem(
                icon: Icon(Icons.home),
                title: ("Utama"),
                iconSize: 35,
                textStyle: primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
                activeColorPrimary: primaryColor,
                inactiveColorPrimary: Colors.grey,
            ),
           PersistentBottomNavBarItem(
                icon: Icon(Icons.person),
                title: ("Saya"),
                iconSize: 35,
                textStyle: primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),
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
