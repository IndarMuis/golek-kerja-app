import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/profile_page/views/widgets/profile_content.dart';

import '../controllers/profile_page_controller.dart';
import 'widgets/prfoile_header.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProfileHeader(),
        SizedBox(height: 20,),
        ProfileContent()
      ],
    );
  }
}
