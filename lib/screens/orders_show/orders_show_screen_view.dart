
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/common/extension/ui_extension.dart';
import 'package:untitled5/common/fonts_variable.dart';
import 'package:untitled5/common/images_path.dart';
import 'package:untitled5/public_files/const.dart';
import 'package:untitled5/screens/orders_show/orders_show_screen_controller.dart';

import '../../common/icons_svg_code.dart';
import '../../common/widgets/a_text.dart';
import 'orders_show_screen_model.dart';

class OrdersShowScreen extends StatelessWidget {
  const OrdersShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          child: Column(
            children: [
              const OrderShowScreenHeader(),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const Expanded(child: OrderShowScreenFooter()),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderShowScreenFooter extends GetView<OrdersShowScreenController> {
  const OrderShowScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersShowScreenController());
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Container(
            decoration:  BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                color: gray.withOpacity(0.4)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0.h),
          child: Align(
            alignment: Alignment.topCenter,
            child: Obx(() => controller.isDoneLoading.value
                ? SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: controller.ordersFromBackEnd
                          .map((order) => OrderShowWidget(order))
                          .toList(),
                    ),
                  )
                : const CircularProgressIndicator()),
          ),
        )
      ],
    );
  }
}

class OrderShowScreenHeader extends StatelessWidget {
  const OrderShowScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240.h,
          width: Get.width,
          child: Image.asset(MyImage.orderShowScreenHeaderImage),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: Get.width * 0.8,
          child: const FittedBox(
            fit: BoxFit.fitWidth,
            child: AText(
              "Here We Will Show Our Orders List",
              fontSize: 20,
              color: dark_purple,
              fontFamily: 'Bauhaus93',
            ),
          ),
        ),
      ],
    );
  }
}

class OrderShowWidget extends StatelessWidget {
  const OrderShowWidget(this.orderDetails, {super.key});

  final OrderOverViewDetails orderDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0.h),
      child: SizedBox(
        height: Get.height * 0.22,
        width: Get.width * 0.85,
        child: Padding(
          padding: EdgeInsets.only(bottom: 4.0.h),
          child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: LayoutBuilder(builder: (context, size) {
                Widget orderDetailShow(String icon, String label) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 5.0.h),
                    child: SizedBox(
                      height: size.maxHeight * 0.15,
                      child: Row(
                        children: [
                          SvgPicture.string(icon),
                          SizedBox(
                            width: size.maxWidth * 0.03,
                          ),
                          AText(
                            label,
                            fontFamily: MyFont.bahnschrift,
                          )
                        ],
                      ),
                    ),
                  );
                }

                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.maxWidth * 0.05,
                      vertical: size.maxHeight * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: size.maxHeight * 0.8,
                          width: size.maxWidth * 0.34,
                          child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(orderDetails.imageURU)),
                        ),
                      ),
                      SizedBox(width: size.maxWidth * 0.06),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          orderDetailShow(
                              MyIcon.orderNameIcon, orderDetails.orderName),
                          orderDetailShow(
                              MyIcon.deliverDataIcon, orderDetails.deliverData),
                          orderDetailShow(MyIcon.appointmentIcon,
                              orderDetails.appointments),
                          SizedBox(
                            height: size.maxHeight * 0.1,
                          ),
                          SizedBox(
                            width: size.maxWidth * 0.5,
                            child:  Row(
                              children: [

                                     CustomToggleButton(),
                                Spacer(),
                                SeeMoreSentinse()
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              })),
        ),
      ),
    );
  }
}

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomToggleButtonState createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
      },
      child: SizedBox(
        width: Get.width*0.15,
          height: Get.height*0.03,
        child: LayoutBuilder(
          builder:(context, size)=> Container(
            width: size.maxWidth,
            height: size.maxHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: isActive ? purple.withOpacity(0.6): Colors.white,
              border: Border.all(
                color: myPurple,
                width: 2.0,
              ),
            ),
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeIn,
                 left: isActive ? size.maxWidth*0.5 : size.maxWidth*0.0,
               right: isActive ? size.maxWidth*0.0 : size.maxWidth*0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: SizedBox(
                      width: size.maxHeight*0.0,
                      height:size.maxHeight*0.75,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: myPurple,
                        ),
                      ),
                    ),
                  ) ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SeeMoreSentinse extends StatelessWidget {
  const SeeMoreSentinse({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the styles
    TextStyle defaultStyle = TextStyle(
      fontFamily: MyFont.Bauhaus93,
      color: Colors.black,
      fontSize: 16.sp,
    );

    TextStyle highlightedStyle = TextStyle(
      color: Colors.purple, // Assume you have defined a color named purple
      fontFamily: MyFont.Bauhaus93,

      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
    );

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Se',
            style: defaultStyle,
          ),
          TextSpan(
            text: 'e Mo',
            style: highlightedStyle, // Style for the second "e"
          ),
          TextSpan(
            text: 're',
            style: defaultStyle,
          ),
        ],
      ),
    );
  }
}
