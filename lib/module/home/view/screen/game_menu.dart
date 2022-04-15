// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class GameMenu extends StatelessWidget {
  const GameMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "List Joki Game",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.count(
              childAspectRatio: 1.2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              crossAxisCount: 2,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                MenuGameWidget(
                  uri:
                      "https://www.xda-developers.com/files/2018/01/Google-Play-Store-Feature-Image-Background-Colour.png",
                  tittle: "Free Fire",
                ),
                MenuGameWidget(
                  uri:
                      "https://www.xda-developers.com/files/2018/01/Google-Play-Store-Feature-Image-Background-Colour.png",
                  tittle: "Mobile Legend",
                ),
                MenuGameWidget(
                  uri:
                      "https://www.xda-developers.com/files/2018/01/Google-Play-Store-Feature-Image-Background-Colour.png",
                  tittle: "Call Of Duty",
                ),
                MenuGameWidget(
                  uri:
                      "https://www.xda-developers.com/files/2018/01/Google-Play-Store-Feature-Image-Background-Colour.png",
                  tittle: "Pokemon",
                ),
                MenuGameWidget(
                  uri:
                      "https://www.xda-developers.com/files/2018/01/Google-Play-Store-Feature-Image-Background-Colour.png",
                  tittle: "Genshin Impact",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuGameWidget extends StatelessWidget {
  final String tittle;
  final String uri;
  const MenuGameWidget({
    Key? key,
    required this.tittle,
    required this.uri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          print("object");
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(),
                decoration: const BoxDecoration(),
                child: Image.network(
                  uri,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                tittle,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
