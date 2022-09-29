import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lokerku/app/theme.dart';

class HistoryLamaranKerjaHeader extends StatelessWidget {
  const HistoryLamaranKerjaHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: double.infinity,
        color: primaryColor,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 5),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: backgroundColor,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "History Lamaran",
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                    color: backgroundColor,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
