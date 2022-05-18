import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: primaryColor,
            radius: 60,
            child: Icon(
              Icons.person,
              size: 100,
              color: backgroundColor,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(defaultMargin),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "GLubin@gmail.com",
              style: primaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(defaultMargin),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "08238901xxxx",
              style: primaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(defaultMargin),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Gustavo Lubin",
              style: primaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(defaultMargin),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "United States",
              style: primaryTextStyle.copyWith(
                fontSize: 15,
                fontWeight: medium,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 30, top: 30),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                       Get.toNamed(Routes.PROFILE_EDIT);
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          minimumSize: Size(double.infinity, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            
                          ),
                          primary: secondaryColor,
                          shadowColor: Colors.transparent),
                      child: Text(
                        "Edit Profile",
                        style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                            color: backgroundColor),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          minimumSize: Size(double.infinity, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: errorColor),
                      child: Text(
                        "Log Out",
                        style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                            color: backgroundColor),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
