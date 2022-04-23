import 'package:flutter/material.dart';
import 'package:joki_apps/Provider/auth_provider.dart';
import 'package:joki_apps/module/auth/register/view/register.dart';
import 'package:joki_apps/module/home/view/home.dart';
import 'package:joki_apps/widget/botton_widget.dart';
import 'package:joki_apps/widget/form_password_widget.dart';
import 'package:joki_apps/widget/form_widget.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var loginProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 255, 255, 255),
      body: SafeArea(
        child: (loginProvider.isLoading)
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
                          controller: loginProvider.usernameController,
                        ),
                        FormPasswordWidget(
                          tittle: "Password",
                          controller: loginProvider.passwordController,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        BottonClassNormal(
                          tittle: "Login",
                          func: () {
                            loginProvider.login();
                          },
                        ),
                        TextButton(
                            onPressed: () {}, child: Text("Forgot Password ?")),
                        SizedBox(
                          height: height * 20 / 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              ),
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
    );
  }
}
