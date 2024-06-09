import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled5/common/extension/t_inkwell_extension.dart';
import 'package:untitled5/common/extension/ui_extension.dart';
import 'package:untitled5/common/fonts_variable.dart';

import 'package:untitled5/common/widgets/a_text.dart';
import 'package:untitled5/screens/order_show/order_show_controller.dart';
import 'package:untitled5/screens/order_show/widgets/bottom_bar.dart';
import 'package:untitled5/screens/order_show/widgets/drawer.dart';
import 'package:untitled5/screens/order_show/widgets/image_slider.dart';
import 'package:untitled5/screens/order_show/widgets/phases_widget.dart';

import '../../common/icons_svg_code.dart';
import '../../public_files/const.dart';
import '../orders_show/orders_show_screen_controller.dart';

class OrderShow extends GetView<OrderShowScreenController> {
  const OrderShow({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderShowScreenController());
    return Scaffold(
      endDrawer: OrdersShowScreenDrawer(),
      key: controller.scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.06,
              width: Get.width,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.string(MyIcon.goBackArrowIcon),
                      InkWell(
                          onTap: controller.openDrawer,
                          child: SvgPicture.string(MyIcon.drawerIcon)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.306,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: MyImageSlider(
                  images: controller.orderDetails.imagesURL,
                ),
              ),
            ),
            const OrderShowScreenPagenationBar(),
            const Expanded(child: MainWidgetToSwapChildren()),
          ],
        ),
      ),
    );
  }
}

class AppointmentsWidgetShow extends StatelessWidget {
  const AppointmentsWidgetShow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        Widget myRow(String label, String data) {
          return Padding(
            padding: EdgeInsets.only(bottom: size.maxHeight * 0.04),
            child: SizedBox(
              height: Get.height * 0.06,
              child: Row(
                children: [
                  SizedBox(
                    width: size.maxWidth * 0.3,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: AText(
                        label,
                        fontFamily: MyFont.bahnschrift,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  SizedBox(
                    width: size.maxWidth * 0.5,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                          color: purple),
                      child: Center(
                        child: AText(
                          data,
                          fontFamily: MyFont.bahnschrift,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              myRow('Delivery Date', 'test'),
              myRow('Appointment', 'test '),
              Divider(
                thickness: 3,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                    width: size.maxWidth * 0.5,
                    height: size.maxHeight * 0.08,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: AText(
                        'Previous Appointments',
                        fontFamily: MyFont.bahnschrift,
                        fontSize: 10,
                        //fontWeight :FontWeight.bold
                      ),
                    )),
              ),
              MyAppointmentsTable(
                appointments: [
                  AppointmentInfo(date: '2024-06-01', time: '10:00 AM'),
                  AppointmentInfo(date: '2024-06-02', time: '2:30 PM'),
                  AppointmentInfo(date: '2024-06-01', time: '10:00 AM'),
                  AppointmentInfo(date: '2024-06-02', time: '2:30 PM'),
                  AppointmentInfo(date: '2024-06-01', time: '10:00 AM'),
                  AppointmentInfo(date: '2024-06-02', time: '2:30 PM'),
                  // Add more appointment data here
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class AppointmentInfo {
  final String date;
  final String time;

  AppointmentInfo({required this.date, required this.time});
}

class MyAppointmentsTable extends StatelessWidget {
  final List<AppointmentInfo> appointments;

  MyAppointmentsTable({required this.appointments});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: AText('Date')),
        DataColumn(label: AText('Time')),
      ],
      rows: appointments.map((info) {
        return DataRow(cells: [
          DataCell(Row(
            children: [
              Icon(Icons.calendar_today), // Icon for date
              SizedBox(width: 8), // Add spacing between icon and text
              Text(info.date), // Display date
            ],
          )),
          DataCell(Row(
            children: [
              Icon(Icons.access_time), // Icon for time
              SizedBox(width: 8), // Add spacing between icon and text
              Text(info.time), // Display time
            ],
          )),
        ]);
      }).toList(),
    );
  }
}

class OrderShowScreenPagenationBar extends GetView<OrderShowScreenController> {
  const OrderShowScreenPagenationBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderShowScreenController());
    return SizedBox(
      height: Get.height * 0.08,
      width: Get.width * 0.84,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: lighPurple),
        child: LayoutBuilder(
          builder: (context, size) {
            Widget pagenationButtonStyle(
                String icon, String label, OrderShowScreenShowMode showMode) => InkWell(
                onTap: () => controller.updateShowMode(showMode),
                child: SizedBox(
                  width: size.maxWidth * 0.28,
                  child: Obx(
                    () {
                      Color itemsColor = controller.showMode.value == showMode
                          ? drawer
                          : black;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: size.maxHeight * 0.1),
                          SizedBox(
                              height: size.maxHeight * 0.45,
                              child: SvgPicture.string(
                                icon,
                                color: itemsColor,
                              )),
                          SizedBox(
                            height: size.maxHeight * 0.45,
                            child: AText(
                              label,
                              fontSize: 14.sp,
                              color: itemsColor,
                              fontFamily: 'ScriptMT',
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              );

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                pagenationButtonStyle(
                    MyIcon.details, "Details", OrderShowScreenShowMode.details),
                pagenationButtonStyle(
                    MyIcon.phases, "Phases", OrderShowScreenShowMode.phases),
                pagenationButtonStyle(MyIcon.appointments, "appointments",
                    OrderShowScreenShowMode.appointments),
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
    Get.put(OrderShowScreenController());
    return Padding(
      padding: EdgeInsets.only(top: Get.width * 0.040),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.075),
        child: SizedBox(
            height: Get.height * 0.5,
            child: Stack(
              children: [
                Obx(() {
                  switch (controller.showMode.value) {
                    case OrderShowScreenShowMode.details:
                      return const OrderDetailsShowWidget();

                    case OrderShowScreenShowMode.phases:
                      return PhasesWidget(
                        phases: controller.orderDetails.phasesInfo,
                      );
                    case OrderShowScreenShowMode.appointments:
                      return AppointmentsWidgetShow();
                  }
                  return Container(
                    child: Text('ERROR'),
                  );
                }),
                Obx(
                  () => Visibility(
                    visible: controller.showMode.value !=
                        OrderShowScreenShowMode.details,
                    child: Column(
                      children: [
                        Expanded(child: Container()),
                        MyBottomBar() ,
                      ],
                    ),
                  ),
                )
              ],
            )),
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
