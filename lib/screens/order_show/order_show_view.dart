import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled5/common/extension/ui_extension.dart';
import 'package:untitled5/common/widgets/a_text.dart';
import 'package:untitled5/screens/order_show/widgets/phases_widget.dart';

import '../../common/icons_svg_code.dart';
import '../../public_files/const.dart';

class OrderShow extends StatelessWidget {
  const OrderShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.4,
            child: MyImageSlider(
              images: [
                'https://via.placeholder.com/400x200/FF0000/FFFFFF?text=Image+1',
                'https://via.placeholder.com/400x200/00FF00/FFFFFF?text=Image+2',
                'https://via.placeholder.com/400x200/0000FF/FFFFFF?text=Image+3',
              ],
            ),
          ),
          const OrderShowScreenPagenationBar(),
          const MainWidgetToSwapChildren()
        ],
      ),
    );
  }
}

class MyImageSlider extends StatefulWidget {
  final List<String> images;

  MyImageSlider({required this.images});

  @override
  _MyImageSliderState createState() => _MyImageSliderState();
}

class _MyImageSliderState extends State<MyImageSlider> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Image.network(
                widget.images[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.images.length, (index) {
            return Container(
              margin: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor:
                    _currentPage == index ? Colors.blue : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}

class OrderShowScreenPagenationBar extends StatelessWidget {
  const OrderShowScreenPagenationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.08,
      width: Get.width * 0.84,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: lighPurple),
        child: LayoutBuilder(
          builder: (context, size) {
            Widget pagenationButtonStyle(String icon, String label) {
              return SizedBox(
                width: size.maxWidth * 0.28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.maxHeight * 0.1),
                    SizedBox(
                        height: size.maxHeight * 0.45,
                        child: SvgPicture.string(icon)),
                    AText(
                      label,
                      fontFamily: 'ScriptMT',
                    )
                  ],
                ),
              );
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                pagenationButtonStyle(MyIcon.details, "Details"),
                pagenationButtonStyle(MyIcon.phases, "Phases"),
                pagenationButtonStyle(MyIcon.appointments, "appointments"),
              ],
            );
          },
        ),
      ),
    );
  }
}

class MainWidgetToSwapChildren extends GetView<OrderShowScreenController> {
  const MainWidgetToSwapChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.width * 0.040),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.075),
        child: SizedBox(
            height: Get.height * 0.5,
            child: true
                ? PhasesWidget(
                    phases: [
                      'Cut',
                      'Plot',
                      'Assemble',
                    ],
                  )
                : OrderDetailsShowWidget()),
      ),
    );
  }
}

class OrderDetailsShowWidget extends GetView<OrderShowScreenController> {
  const OrderDetailsShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderShowScreenController());
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, size) {
            Widget mainInfoShow(String icon, String data) {
              return SizedBox(
                width: size.maxWidth * 0.4,
                child: Row(
                  children: [
                    SvgPicture.string(icon),
                    SizedBox(
                      width: size.maxWidth * 0.025,
                    ),
                    AText(data)
                  ],
                ),
              );
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                mainInfoShow(
                    MyIcon.clinetName, controller.orderDetails.clientName),
                mainInfoShow(
                    MyIcon.clintPhone, controller.orderDetails.clientPhone)
              ],
            );
          },
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        Expanded(child: Container()),
        SizedBox(
          height: Get.height * 0.45,
          child: LayoutBuilder(builder: (context, size) {
            Widget rectangleWithData(String label, String data,
                {required bool isThemeOne}) {
              return SizedBox(
                height: size.maxHeight * 0.2,
                width: size.maxWidth * 0.48,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: isThemeOne ? drawer : orange,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AText(
                        label,
                        color: isThemeOne ? black : purple,
                      ),
                      AText(
                        data,
                        color: isThemeOne ? light_lilac : black,
                      ),
                    ],
                  ),
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    rectangleWithData("Size", controller.orderDetails.size,
                        isThemeOne: true),
                    rectangleWithData(
                        "Fabric type", controller.orderDetails.fabricType,
                        isThemeOne: false)
                  ],
                ),
                SizedBox(
                  height: size.maxHeight * 0.4,
                  width: size.maxHeight * 0.4,
                  child: Opacity(
                    opacity: 0.4,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    rectangleWithData("Height", controller.orderDetails.height,
                        isThemeOne: false),
                    rectangleWithData("Color", controller.orderDetails.color,
                        isThemeOne: true)
                  ],
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}

class OrderShowScreenController extends GetxController {
  late OrderDetails orderDetails;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    orderDetails = await OrderShowScreenModel.getOrderDetails();
  }
}

class OrderShowScreenModel {
  static Future<OrderDetails> getOrderDetails() async {
    OrderDetails myOrder;
    await Future.delayed(Duration(seconds: 2));
    myOrder = OrderDetails(
        imageURL: '',
        clientName: 'clientName',
        clientPhone: '0982154430',
        size: '38',
        fabricType: 'cotton',
        height: 'Short',
        color: 'Purple');

    return myOrder;
  }
}

class OrderDetails {
  String imageURL, clientName, clientPhone, size, fabricType, height, color;

  OrderDetails(
      {required this.imageURL,
      required this.clientName,
      required this.clientPhone,
      required this.size,
      required this.fabricType,
      required this.height,
      required this.color});
}
