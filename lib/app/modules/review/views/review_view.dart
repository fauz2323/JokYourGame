import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/review_controller.dart';

class ReviewView extends GetView<ReviewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReviewView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
