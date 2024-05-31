import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/screens/chat_screen/chat_screen_view.dart';
import 'package:untitled5/screens/order_show/order_show_view.dart';

import 'screens/chat_screen/chat_screen_model.dart';

void main() {
  runApp( MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: ChatScreen(),
    );
  }
}


