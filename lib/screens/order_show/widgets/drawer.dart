import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled5/common/fonts_variable.dart';
import 'package:untitled5/common/icons_svg_code.dart';
import 'package:untitled5/common/image_variables.dart';
import 'package:untitled5/common/widgets/a_text.dart';
import 'package:untitled5/public_files/const.dart';
import 'package:untitled5/screens/order_show/order_show_controller.dart';

class OrdersShowScreenDrawer extends GetView<OrderShowScreenController> {
  const OrdersShowScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width * 0.5,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: LayoutBuilder(
            builder: (context, size) {
              Widget drawerRow(String icon, String label) {
                return SizedBox(
                  width: size.maxWidth,
                  height: size.maxHeight * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.string(icon),
                      AText(
                        label,
                        fontFamily: MyFont.Bauhaus93,
                      )
                    ]
                        .map((e) => Padding(
                              padding:
                                  EdgeInsets.only(left: size.maxWidth * 0.08),
                              child: e,
                            ))
                        .toList(),
                  ),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(MyImage.logo),
                  AText(
                    "Welcome",
                    fontSize: 22,
                    fontFamily: MyFont.ScriptMT,
                  ),
                  const Divider(
                    thickness: 1,
                    color: black,
                  ),
                  drawerRow(MyIcon.homeIcon, "Home"),
                  drawerRow(MyIcon.profileIcon, "Profile"),
                  drawerRow(MyIcon.logout, 'logout'),
                  Expanded(child: Container()),
                  Opacity(opacity: 0.2, child: Image.asset(MyImage.logo)),
                  SizedBox(
                    height: size.maxHeight * 0.1,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
