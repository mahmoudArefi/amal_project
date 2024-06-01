import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/screens/chat_screen/chat_screen_model.dart';
import 'package:untitled5/screens/chat_screen/chat_screen_view.dart';

class ChatScreenController extends GetxController {
  RxList<ChatBubble> messages = <ChatBubble>[].obs;
  final TextEditingController messageController = TextEditingController();
  
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    messages.value = await ChatScreenModel.getTheConversation() ;
  }
  


  void onSendMessage() {
    if (messageController.text.isNotEmpty) {
      messages.add(ChatBubble(
        message: messageController.text,
        timestamp: "08:43", // you can dynamically generate this
        isSentByMe: true,
      ));
      messageController.clear();
    }
  }


}
