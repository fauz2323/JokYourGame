import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:joki_apps/module/auth/login/view/login.dart';
import 'package:joki_apps/module/home/controller/home_controller.dart';

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
              PopupMenuButton(
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
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(15),
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              image: DecorationImage(
                image: AssetImage(
                  'image/bg-card.jpg',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your Balance : ${homeCOntroller.authModel.data.balance}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Personal User",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Join Date",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "12-12-2022",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "Kepuasan Pelanggan adalah yang utama",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Menu Apps"),
        ],
      ),
    );
  }
}
