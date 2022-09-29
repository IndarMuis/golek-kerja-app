import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/data_usaha/controllers/data_usaha_controller.dart';
import 'package:lokerku/app/modules/data_usaha/views/widgets/data_usaha_form.dart';
import 'package:lokerku/app/modules/data_usaha/views/widgets/data_usaha_header.dart';

import '../../../theme.dart';

class DataUsahaView extends GetView<DataUsahaController> {
  @override
  Widget build(BuildContext context) {
    print("Tetsss");
    // print(controller.emailController.text);
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: ListView(
            children: [
              DataUsahaHeader(),
              SizedBox(
                height: 30,
              ),
              DataUsahaForm()
            ],
          )),
    );
  }
}
