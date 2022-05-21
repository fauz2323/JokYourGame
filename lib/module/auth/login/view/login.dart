import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joki_apps/module/auth/login/controller/login_controller.dart';
import 'package:joki_apps/module/auth/register/view/register.dart';
import 'package:joki_apps/module/home/view/home.dart';
import 'package:joki_apps/widget/botton_widget.dart';
import 'package:joki_apps/widget/form_password_widget.dart';
import 'package:joki_apps/widget/form_widget.dart';
import 'package:provider/provider.dart';

class Login extends GetView<LoginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color.fromARGB(230, 255, 255, 255),
        body: Obx(
          () => SafeArea(
            child: (controller.loading.value)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * 20 / 100,
                            ),
                            Text("JOK"),
                            Text('Your Game'),
                            SizedBox(
                              height: 40,
                            ),
                            FormWidgetNormal(
                              tittle: "Username",
                              controller: controller.usernameController,
                            ),
                            FormPasswordWidget(
                              tittle: "Password",
                              controller: controller.passwordController,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            BottonClassNormal(
                              tittle: "Login",
                              func: () {
                                controller.login();
                              },
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text("Forgot Password ?")),
                            SizedBox(
                              height: height * 20 / 100,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account?"),
                                InkWell(
                                  onTap: () => Get.toNamed('/register'),
                                  child: Text(" Sign Up",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ));
  }
}
