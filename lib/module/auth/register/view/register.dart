import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joki_apps/module/auth/register/controller/register_controller.dart';
import 'package:joki_apps/widget/botton_widget.dart';
import 'package:joki_apps/widget/form_password_widget.dart';
import 'package:joki_apps/widget/form_widget.dart';
import 'package:provider/provider.dart';

class Register extends GetView<RegisterCOntroller> {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(230, 255, 255, 255),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black.withOpacity(0.7),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Text("Jok"),
                          Text("Your Game"),
                          SizedBox(
                            height: 60,
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FormWidgetNormal(
                            tittle: "username",
                            controller: controller.username,
                          ),
                          FormWidgetNormal(
                            tittle: "Email",
                            controller: controller.email,
                          ),
                          FormWidgetNormal(
                            tittle: "Phone Number",
                            controller: controller.number,
                          ),
                          FormPasswordWidget(
                            tittle: "Password",
                            controller: controller.password,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          BottonClassNormal(
                              tittle: "Register",
                              func: () {
                                controller.register();
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}
