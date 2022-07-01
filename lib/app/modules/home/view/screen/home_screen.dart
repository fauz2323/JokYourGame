import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:joki_apps/app/modules/auth/login/view/login.dart';
import 'package:joki_apps/app/modules/home/controller/home_controller.dart';

import '../widget/cardhome_widget.dart';
import '../widget/popupmenu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.homeCOntroller}) : super(key: key);
  final HomeCOntroller homeCOntroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: 30,
        right: 30,
      ),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hello, ${homeCOntroller.authModel.name}",
                style: TextStyle(fontSize: 25),
              ),
              PopUpMenuWidget(homeCOntroller: homeCOntroller),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CardHome(homeCOntroller: homeCOntroller),
          SizedBox(
            height: 20,
          ),
          Text("Menu Apps"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuItems(
                tap: () {
                  Get.offNamed('/product', arguments: 'all');
                },
                tittle: "All Product",
                icon: Icons.production_quantity_limits,
              ),
              MenuItems(
                tap: () {
                  Get.toNamed('list-all-topup');
                },
                tittle: "History Topup",
                icon: Icons.history,
              ),
              MenuItems(
                tap: () {
                  Get.toNamed('order-list');
                },
                tittle: "Status Order",
                icon: Icons.double_arrow,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuItems(
                tap: () => Get.toNamed('setting'),
                tittle: "Setting",
                icon: Icons.settings,
              ),
              MenuItems(
                tap: () {
                  Get.toNamed('/chat');
                },
                tittle: "Chat",
                icon: Icons.message,
              ),
              MenuItems(
                tap: () => homeCOntroller.logout(),
                tittle: "LogOut",
                icon: Icons.logout,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  const MenuItems({
    Key? key,
    required this.tap,
    required this.icon,
    required this.tittle,
  }) : super(key: key);
  final VoidCallback tap;
  final IconData icon;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: Get.width * 25 / 100,
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Icon(
                icon,
                size: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                tittle,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
