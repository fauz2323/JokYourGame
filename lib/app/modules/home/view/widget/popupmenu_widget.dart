import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class PopUpMenuWidget extends StatelessWidget {
  const PopUpMenuWidget({
    Key? key,
    required this.homeCOntroller,
  }) : super(key: key);

  final HomeCOntroller homeCOntroller;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.people_alt_rounded),
      itemBuilder: ((context) => [
            PopupMenuItem(
              child: TextButton(
                onPressed: () {},
                child: Text('Edit Profile'),
              ),
            ),
            PopupMenuItem(
              child: TextButton(
                onPressed: () {
                  Get.offAllNamed('/topup');
                },
                child: Text('Top Up Fund(s)'),
              ),
            ),
            PopupMenuItem(
              child: TextButton(
                onPressed: () {},
                child: Text('Message(s)'),
              ),
            ),
            PopupMenuItem(
              child: TextButton(
                onPressed: () {},
                child: Text('Order(s)'),
              ),
            ),
            PopupMenuItem(
              child: TextButton(
                onPressed: () {
                  homeCOntroller.logout();
                },
                child: Text('Log Out'),
              ),
            ),
          ]),
    );
  }
}
