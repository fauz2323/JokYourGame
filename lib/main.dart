import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joki_apps/Provider/auth_provider.dart';
import 'package:joki_apps/module/splash/view/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Color.fromARGB(230, 255, 255, 255),
          scaffoldBackgroundColor: Color.fromARGB(230, 255, 255, 255),
        ),
        home: const Splash(),
      ),
    );
  }
}
