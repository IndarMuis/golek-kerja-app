import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lokerku/app/modules/detail_job/views/widgets/detail_job_content.dart';
import 'package:lokerku/app/modules/detail_job/views/widgets/detail_job_header.dart';
import 'package:lokerku/app/theme.dart';

import '../controllers/detail_job_controller.dart';

class DetailJobView extends GetView<DetailJobController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          children: [
            DetailJobHeader(),
            SizedBox(
              height: 20,
            ),
            DetailJobContent(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 38),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Lamar Sekarang",
                            style: primaryTextStyle.copyWith(
                                fontSize: 15,
                                color: backgroundColor,
                                fontWeight: medium),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.chat,
                        size: 30,
                        color: backgroundColor,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: secondaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
