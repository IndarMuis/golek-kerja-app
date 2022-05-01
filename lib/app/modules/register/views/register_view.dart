import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/register/views/widgets/registrasi_form.dart';
import 'package:lokerku/app/modules/register/views/widgets/registrasi_header.dart';
import 'package:lokerku/app/theme.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: ListView(
            children: [
              RegisternHeader(title: "Registrasi",),
              SizedBox(
                height: 30,
              ),
              RegisterForm()
            ],
          )),
    );
  }
}
