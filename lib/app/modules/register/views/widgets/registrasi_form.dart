import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

import 'registrasi_profile_form.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 75, left: defaultMargin, right: defaultMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: medium),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "example@gmail.com",
                hintStyle: primaryTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: light,
                    fontStyle: FontStyle.italic,
                    color: Colors.black.withOpacity(0.5))),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Nomor Telepon",
            style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: medium),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "082193549XXX",
                hintStyle: primaryTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: light,
                    fontStyle: FontStyle.italic,
                    color: Colors.black.withOpacity(0.5))),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Username",
            style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: medium),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "Indar",
                hintStyle: primaryTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: light,
                    fontStyle: FontStyle.italic,
                    color: Colors.black.withOpacity(0.5))),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Password",
            style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: medium),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "minimal 8 karakter",
                hintStyle: primaryTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: light,
                    fontStyle: FontStyle.italic,
                    color: Colors.black.withOpacity(0.5))),
          ),
          SizedBox(height: 50),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.transparent,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: secondaryColor,
                shape: StadiumBorder()
              ),
                onPressed: () {
                  Get.toNamed(Routes.HOME);
                },
                child: Text(
                  "Daftar",
                  style: primaryTextStyle.copyWith(
                    fontSize: 23,
                    fontWeight: medium,
                    color: backgroundColor,
                  ),
                )),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sudah punya akun ? ", style: primaryTextStyle.copyWith(fontSize: 17, fontWeight: light),),
              GestureDetector(
                onTap: () {
                  Get.offAllNamed(Routes.LOGIN);
                },
                child: Text("Masuk", style: primaryTextStyle.copyWith(fontSize: 17, fontWeight: light, color: primaryColor),))
            ],
          )
        ],
      ),
    );
  }
}
