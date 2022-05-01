import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/login/views/widgets/login_form.dart';
import 'package:lokerku/app/modules/login/views/widgets/login_header.dart';
import 'package:lokerku/app/theme.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          children: [
            LoginHeader(),
            SizedBox(height: 30,),
            LoginForm()
            
          ],
        )
      ),
    );
  }
}
