import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/data_profile/views/widgets/data_profile_form.dart';
import 'package:lokerku/app/modules/data_profile/views/widgets/data_profile_header.dart';
import 'package:lokerku/app/modules/data_usaha/views/widgets/data_usaha_form.dart';
import 'package:lokerku/app/theme.dart';

import '../controllers/data_profile_controller.dart';

class DataProfileView extends GetView<DataProfileController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: ListView(
            children: [
              DataProfileHeader(),
              SizedBox(
                height: 30,
              ),
              DataProfileForm()
            ],
          )),
    );
  }
}
