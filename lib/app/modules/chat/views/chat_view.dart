import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Message'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => ListView(
                            children: controller.messageModel
                                .map(
                                  (element) => ChatMessageWidget(
                                    pengirim: element.from,
                                    message: element.message,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      width: Get.width,
                      height: Get.height * 8 / 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: Get.width * 70 / 100,
                            child: TextFormField(
                              controller: controller.messageController,
                              decoration:
                                  InputDecoration(hintText: "Text Here"),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.sendMessage(
                                  controller.messageController.text);
                              controller.messageController.text = "";
                            },
                            icon: Icon(Icons.send),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    Key? key,
    required this.pengirim,
    required this.message,
  }) : super(key: key);

  final String pengirim;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          pengirim == 'admin' ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        children: [
          Align(
            child: Text(pengirim),
            alignment: pengirim == 'admin'
                ? Alignment.centerLeft
                : Alignment.centerRight,
          ),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: pengirim == 'admin'
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(bottom: 16),
              constraints: BoxConstraints(maxWidth: 300, minWidth: 0),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 0.4,
                    blurRadius: 0.5,
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text(message),
            ),
          ),
        ],
      ),
    );
  }
}
