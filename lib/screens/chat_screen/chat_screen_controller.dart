import 'package:get/get.dart';
import 'package:untitled5/screens/chat_screen/chat_screen_model.dart';
import 'package:untitled5/screens/chat_screen/chat_screen_view.dart';

class ChatScreenController extends GetxController {
  RxList<ChatBubble> messages = <ChatBubble>[].obs;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    messages.value = await ChatScreenModel.getTheConversation() ;
  }


}
