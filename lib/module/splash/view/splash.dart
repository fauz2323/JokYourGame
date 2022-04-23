import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:joki_apps/module/auth/login/view/login.dart';
import 'package:joki_apps/module/home/view/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final storage = FlutterSecureStorage();
    Timer(Duration(seconds: 3), () async {
      var data = await storage.read(key: 'token');
      if (data == null) {
        Get.offAll(() => Login());
      } else {
        Get.offAll(() => Home());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("LOGO"),
            Text(
              "JOK YOUR GAME",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 26,
              ),
            )
          ],
        ),
      ),
    );
  }
}
