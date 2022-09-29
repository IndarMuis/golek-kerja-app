import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/profile_page/views/widgets/profile_content.dart';
import 'package:lokerku/app/theme.dart';

import '../controllers/profile_page_controller.dart';
import 'widgets/prfoile_header.dart';
import 'widgets/profile_content_pelamar.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  var controller = Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          ProfileHeader(),
          SizedBox(
            height: 20,
          ),
          (controller.isLoading.value)
              ? CircularProgressIndicator(
                  color: primaryColor,
                )
              : (controller.userType.value == 1)
                  ? ProfileContent()
                  : ProfileContentPelamar()
        ],
      ),
    );
  }
}
