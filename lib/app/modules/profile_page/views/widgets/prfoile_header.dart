import 'package:flutter/material.dart';
import 'package:lokerku/app/theme.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(250, 50),
              bottomRight: Radius.elliptical(250, 50))),
      child: Center(
          child: Text(
        "PROFILE",
        style: primaryTextStyle.copyWith(
          fontSize: 30,
          fontWeight: semiBold,
          color: backgroundColor,
        ),
      )),
    );
  }
}
