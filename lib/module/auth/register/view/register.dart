import 'package:flutter/material.dart';
import 'package:joki_apps/widget/botton_widget.dart';
import 'package:joki_apps/widget/form_password_widget.dart';
import 'package:joki_apps/widget/form_widget.dart';

class Register extends StatelessWidget {
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
      body: SingleChildScrollView(
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
                FormWidgetNormal(tittle: "username"),
                FormWidgetNormal(tittle: "Name"),
                FormWidgetNormal(tittle: "Email"),
                FormPasswordWidget(tittle: "Password"),
                SizedBox(
                  height: 30,
                ),
                BottonClassNormal(tittle: "Register", func: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
