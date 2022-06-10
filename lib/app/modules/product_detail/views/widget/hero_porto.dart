import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroPortofolio extends StatelessWidget {
  const HeroPortofolio({Key? key, required this.uri}) : super(key: key);
  final String uri;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Hero(
              tag: 'porto-hero',
              child: CachedNetworkImage(
                imageUrl: uri,
                placeholder: (BuildContext context, String) =>
                    new CircularProgressIndicator(),
                errorWidget: (BuildContext context, String, dynamic) =>
                    new Icon(Icons.error),
              ),
            ),
          ),
        ));
  }
}
