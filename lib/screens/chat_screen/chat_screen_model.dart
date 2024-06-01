import 'chat_screen_view.dart';

class ChatScreenModel {
  static Future<List<ChatBubble>> getTheConversation() async {
    List<ChatBubble> messagesFromBackEnd = [];
    await Future.delayed(Duration(seconds: 2));
    for (int i = 0; i < 20; i++) {
      messagesFromBackEnd.add(
        ChatBubble(
            message: "Hello , can i ask you some help",
            timestamp: "8:20",
            isSentByMe: false),
      );
    }
    return messagesFromBackEnd;
  }

  static sendTheMessageToServer(String message) async {}

  static getBasicInfo() async {}
}

class ChatBasicInfo {
  String clientName, firstImageUrl, secondImageUrl;

  ChatBasicInfo({
    required this.clientName,
    required this.firstImageUrl,
    required this.secondImageUrl,
  });
}
