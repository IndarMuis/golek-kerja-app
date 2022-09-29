import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokerku/app/modules/register/controllers/register_controller.dart';
import 'package:lokerku/app/routes/app_pages.dart';
import 'package:lokerku/app/theme.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  // var controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        builder: (controller) => Container(
              margin: EdgeInsets.only(
                  bottom: 75, left: defaultMargin, right: defaultMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: "Jenis Pengguna",
                          hintStyle: primaryTextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: light,
                              fontStyle: FontStyle.italic,
                              color: Colors.black.withOpacity(0.5))),
                      items: controller.jenisPengguna.map((menu) {
                        return DropdownMenuItem<String>(
                          value: menu,
                          child: Text(menu),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value == "Usaha") {
                          controller.pilihanPengguna.value = 1;
                        } else {
                          controller.pilihanPengguna.value = 2;
                        }
                        print("Pilihan Pengguna : " +
                            controller.pilihanPengguna.value.toString());
                      }),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: controller.usernameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Username",
                        hintStyle: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: light,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Email",
                        hintStyle: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: light,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: controller.nomorTeleponController,
                    keyboardType: TextInputType.phone,
                    maxLength: 13,
                    decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "Nomor Telepon",
                        hintStyle: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: light,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: "minimal 8 karakter",
                        hintStyle: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: light,
                            fontStyle: FontStyle.italic,
                            color: Colors.black.withOpacity(0.5))),
                  ),
                  SizedBox(height: 50),
                  Obx(() => Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: secondaryColor,
                                shape: StadiumBorder()),
                            onPressed: () {
                              controller.register(
                                  controller.pilihanPengguna.value,
                                  controller.usernameController.text,
                                  controller.emailController.text,
                                  controller.nomorTeleponController.text,
                                  controller.passwordController.text);
                            },
                            child: (!controller.loading.value)
                                ? Text(
                                    "Daftar",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 23,
                                      fontWeight: medium,
                                      color: backgroundColor,
                                    ),
                                  )
                                : CircularProgressIndicator(
                                    color: backgroundColor,
                                  )),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah punya akun ? ",
                        style: primaryTextStyle.copyWith(
                            fontSize: 17, fontWeight: light),
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.offAllNamed(Routes.LOGIN);
                          },
                          child: Text(
                            "Masuk",
                            style: primaryTextStyle.copyWith(
                                fontSize: 17,
                                fontWeight: light,
                                color: primaryColor),
                          ))
                    ],
                  )
                ],
              ),
            ));
  }
}
