import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokerku/app/theme.dart';

successSnackBar({String? title, String? message}) {
  return Get.snackbar(
    "",
    "",
    backgroundColor: secondaryColor.withOpacity(0.6),
    icon: Icon(
      Icons.check_circle,
      color: backgroundColor,
      size: 55,
    ),
    padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 15),
    borderWidth: 1,
    titleText: Center(
        child: Text(
      "${title}",
      style: primaryTextStyle.copyWith(
        fontSize: 16,
        color: backgroundColor,
        fontWeight: semiBold,
      ),
    )),
    messageText: Center(
        child: Text(
      "${message}",
      style: primaryTextStyle.copyWith(
        fontSize: 13,
        color: backgroundColor,
        fontWeight: medium,
      ),
      textAlign: TextAlign.center,
    )),
  );
}

errorSnackBar({String? title, String? message}) {
  return Get.snackbar(
    "",
    "",
    duration: Duration(seconds: 3),
    backgroundColor: errorColor.withOpacity(0.6),
    icon: Icon(
      Icons.error,
      color: backgroundColor,
      size: 55,
    ),
    padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 15),
    borderWidth: 1,
    titleText: Center(
        child: Text(
      "${title}",
      style: primaryTextStyle.copyWith(
        fontSize: 16,
        color: backgroundColor,
        fontWeight: semiBold,
      ),
    )),
    messageText: Center(
        child: Text(
      "${message}",
      style: primaryTextStyle.copyWith(
        fontSize: 13,
        color: backgroundColor,
        fontWeight: medium,
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
    )),
  );
}
