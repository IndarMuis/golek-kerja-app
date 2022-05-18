import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

import '../controllers/profile_page_controller.dart';

class ProfileEditPageView extends GetView<ProfilePageController> {
  const ProfileEditPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget formEmail() {
      return TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Glubin@gmail.com",
        ),
      );
    }

    Widget formNomor() {
      return TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "082915782XXX",
        ),
      );
    }

    Widget formUsername() {
      return TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Gustavo Lubin",
        ),
      );
    }

    Widget formPassword() {
      return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "password: minimum 4 character",
            hintStyle: TextStyle(fontStyle: FontStyle.italic)),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Edit Profile",
          style: primaryTextStyle.copyWith(color: backgroundColor),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              backgroundColor: primaryColor,
              child: Icon(
                Icons.person,
                color: backgroundColor,
                size: 90,
              ),
              radius: 70,
            ),
            SizedBox(
              height: 50,
            ),
            formEmail(),
            SizedBox(
              height: 25,
            ),
            formNomor(),
            SizedBox(
              height: 25,
            ),
            formUsername(),
            SizedBox(
              height: 25,
            ),
            formPassword(),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                ElevatedButton(
                      onPressed: () {
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
                        "Simpan",
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
                        Get.offAllNamed(Routes.HOME);
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          minimumSize: Size(double.infinity, 30),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: primaryColor),
                              borderRadius: BorderRadius.circular(10)),
                              primary: backgroundColor
                          ),
                      child: Text(
                        "Batal",
                        style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                            color: primaryColor),
                      )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
