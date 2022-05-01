import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 75, left: defaultMargin, right: defaultMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email atau Nomor Telepon",
            style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: medium),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "example@gmail.com / 082195734XXX",
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
                hintText: "password",
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
                  Get.offAllNamed(Routes.HOME);
                },
                child: Text(
                  "Masuk",
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
              Text("Belum punya akun ? ", style: primaryTextStyle.copyWith(fontSize: 17, fontWeight: light),),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.REGISTER_PROFILE_FORM);
                },
                child: Text("Daftar", style: primaryTextStyle.copyWith(fontSize: 17, fontWeight: light, color: primaryColor),))
            ],
          )
        ],
      ),
    );
  }
}
