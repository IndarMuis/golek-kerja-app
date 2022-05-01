import 'package:flutter/material.dart';

import '../../../../theme.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({ Key? key }) : super(key: key);

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
            margin: EdgeInsets.only(bottom: 50, left: defaultMargin, right: defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Aplikasi Lowongan Kerja",
                  style: primaryTextStyle.copyWith(
                fontWeight: bold,
                  fontSize: 35, color: backgroundColor),
                ),
                SizedBox(height: 10,),
                Text(
                  "Mulai cari kerja sekarang",
                  style: primaryTextStyle.copyWith(
                fontWeight: light,
                  fontSize: 20, color: backgroundColor),
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