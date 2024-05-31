import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/public_files/const.dart';
import 'package:untitled5/screens/chat_screen/chat_screen_controller.dart';

class ChatScreen extends GetView<ChatScreenController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatScreenController());

    return Scaffold(
      body: Column(
        children: [
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
    );
  }
}

class SenderWidget extends GetView<ChatScreenController> {
  SenderWidget({super.key});

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      controller.messages.add(ChatBubble(
        message: _controller.text,
        timestamp: "08:43", // you can dynamically generate this
        isSentByMe: true,
      ));
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ChatScreenController());
    double myHeight = Get.height * 0.07;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05, vertical: Get.height * 0.01),
      child: SizedBox(
        height: myHeight,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  fillColor: purple1,
                  enabled: true,
                  filled: true,
                  hintText: "Type a message",
                  hintStyle: const TextStyle(color: light_purple),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                ),
              ),
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
                  onPressed: _sendMessage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final String timestamp;
  final bool isSentByMe;

  const ChatBubble({super.key,
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
