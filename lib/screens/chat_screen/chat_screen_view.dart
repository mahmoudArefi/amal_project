import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:untitled5/common/extension/ui_extension.dart';
import 'package:untitled5/common/image_variables.dart';
import 'package:untitled5/common/widgets/a_text.dart';
import 'package:untitled5/public_files/const.dart';
import 'package:untitled5/screens/chat_screen/chat_screen_controller.dart';

class ChatScreen extends GetView<ChatScreenController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatScreenController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.034),
          child: Column(
            children: [
              const ChatScreenAppBar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Obx(
                    () => ListView(
                      children: controller.messages,
                    ),
                  ),
                ),
              ),
              SenderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatScreenAppBar extends StatelessWidget {
  const ChatScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.086,
      width: Get.width,
      child: LayoutBuilder(
        builder: (context, size) {
          return Row(
            children: [
              SizedBox(
                height: size.maxHeight,
                width: size.maxWidth * 0.15,
                child: CircleAvatar(
                  //     backgroundImage: Image.asset(MyImage.logo),
                  child: Image.asset(MyImage.logo),
                ),
              ),
              SizedBox(
                width: size.maxWidth * 0.03,
              ),
              SizedBox(
                height: size.maxHeight,
                width: size.maxWidth * 0.15,
                child: CircleAvatar(
                  //     backgroundImage: Image.asset(MyImage.logo),
                  child: Image.asset(MyImage.logo),
                ),
              ),
              Expanded(child: Container()),
              AText("Martina Woln \nMaciej KowALSKI"),
              SizedBox(
                width: size.maxWidth * 0.05,
              )
            ],
          );
        },
      ),
    );
  }
}

class SenderWidget extends GetView<ChatScreenController> {
  SenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatScreenController());
    double myHeight = Get.height * 0.07;
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * 0.02),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.03, vertical: Get.height * 0.0),
        child: SizedBox(
          height: myHeight,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.messageController,
                  decoration: InputDecoration(
                    fillColor: purple1,
                    filled: true,
                    hintText: "Write",
                    hintStyle: const TextStyle(color: light_purple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                      borderSide: BorderSide.none, // Remove the border color
                    ),
                  ),
                )

              ),
              SizedBox(
                width: Get.width * 0.04,
              ),
              SizedBox(
                height: myHeight,
                width: myHeight,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                    color: purple1,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: light_purple,
                    ),
                    onPressed: controller.onSendMessage,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final String timestamp;
  final bool isSentByMe;

  const ChatBubble({
    super.key,
    required this.message,
    required this.timestamp,
    required this.isSentByMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: isSentByMe ? Colors.purple.shade100 : Colors.purple,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              message,
              style: TextStyle(color: isSentByMe ? Colors.black : Colors.white),
            ),
          ),
          if (timestamp.isNotEmpty)
            Text(
              timestamp,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
        ],
      ),
    );
  }
}
