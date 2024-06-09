import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled5/screens/chat_screen/chat_screen_view.dart';
import 'package:untitled5/screens/login_screen/login_screen_view.dart';
import 'package:untitled5/screens/order_show/order_show_view.dart';
import 'package:untitled5/screens/orders_show/orders_show_screen_view.dart';

import 'screens/chat_screen/chat_screen_model.dart';

void main() {
  runApp( MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // Set the design size as per your design
      minTextAdapt: true, // Optional
      splitScreenMode: true, // Optional
      builder:(context,child)=> GetMaterialApp(
        home: OrdersShowScreen(),
      ),
    );
  }
}


