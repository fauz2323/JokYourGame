import 'package:flutter/material.dart';
import 'package:joki_apps/module/splash/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Color.fromARGB(230, 255, 255, 255),
        scaffoldBackgroundColor: Color.fromARGB(230, 255, 255, 255),
      ),
      home: const Splash(),
    );
  }
}
