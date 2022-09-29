import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokerku/app/routes/app_pages.dart';

import '../../../../theme.dart';

class RegisternHeader extends StatelessWidget {
  RegisternHeader({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 350,
          width: double.infinity,
          color: primaryColor,
          child: Container(
            margin: EdgeInsets.only(
                bottom: 50, left: defaultMargin, right: defaultMargin, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 35,
                    color: backgroundColor,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  "Registrasi",
                  style: primaryTextStyle.copyWith(
                      fontWeight: bold, fontSize: 35, color: backgroundColor),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: backgroundColor),
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        ),
      ],
    );
  }
}
