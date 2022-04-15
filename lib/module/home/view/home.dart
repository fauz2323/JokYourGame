import 'package:flutter/material.dart';
import 'package:joki_apps/module/home/view/screen/about_us.dart';
import 'package:joki_apps/module/home/view/screen/game_menu.dart';
import 'package:joki_apps/module/home/view/screen/home_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Jok Your Game"),
          centerTitle: true,
          elevation: 0,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("Game"),
              ),
              Tab(
                child: Text("Home"),
              ),
              Tab(
                child: Text("About Apps"),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            GameMenu(),
            HomeScreen(),
            AboutUs(),
          ],
        ),
      ),
    );
  }
}
