import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
      body: SizedBox(
        height: Get.height,
        child: const Column(
          children: [
            OrderShowScreenHeader(),
            OrderShowScreenFooter(),
          ],
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
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: Get.width * 0.9,
          child: Container(
            decoration: BoxDecoration(
                color: gray.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Obx(() => controller.isDoneLoading.value
                ? SingleChildScrollView(
                    child: Column(
                      children: controller.ordersFromBackEnd
                          .map((order) => OrderShowWidget(order))
                          .toList(),
                    ),
                  )
                : const CircularProgressIndicator()),
          ),
        ),
      ),
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
          height: 240,
          width: Get.width,
          child: Image.asset(MyImage.orderShowScreenHeaderImage),
        ),
        const AText(
          "Here We Will Show Our Orders List",
          color: dark_purple,
          fontFamily: 'Bauhaus93',
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
    return SizedBox(
      height: Get.height * 0.22,
      width: Get.width * 0.85,
      child: Container(
          decoration: const BoxDecoration(
              color: gray, borderRadius: BorderRadius.all(Radius.circular(15))),
          child: LayoutBuilder(builder: (context, size) {
            Widget orderDetailShow(String icon, String label) {
              return SizedBox(
                height: size.maxHeight * 0.15,
                child: Row(
                  children: [
                    SvgPicture.string(icon),
                    SizedBox(
                      width: size.maxWidth * 0.03,
                    ),
                    AText(
                      label,
                    )
                  ],
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
                      orderDetailShow(
                          MyIcon.appointmentIcon, orderDetails.appointments),
                      SizedBox(
                        height: size.maxHeight * 0.1,
                      ),
                      Row(
                        children: [
                          CustomToggleButton(),
                          SeeMoreSentinse()
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          })),
    );
  }
}

class CustomToggleButton extends StatefulWidget {
  @override
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
      child: Container(
        width: 60.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: isActive ? Colors.green : Colors.grey,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: Duration(milliseconds: 250),
              curve: Curves.easeIn,
              left: isActive ? 30.0 : 0.0,
              right: isActive ? 0.0 : 30.0,
              child: Container(
                width: 28.0,
                height: 28.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ],
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
      color: Colors.black,
      fontSize: 20,
    );

    TextStyle highlightedStyle = TextStyle(
      color: Colors.purple, // Assume you have defined a color named purple
      fontSize: 20,
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

