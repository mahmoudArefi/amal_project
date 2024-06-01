import 'package:get/get.dart';

import 'order_show_model.dart';

class OrderShowScreenController extends GetxController {
  late OrderDetails orderDetails;

  Rx<OrderShowScreenShowMode> showMode = OrderShowScreenShowMode.phases.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    orderDetails = await OrderShowScreenModel.getOrderDetails();
  }

  updateShowMode(OrderShowScreenShowMode newMode) {
    showMode.value = newMode;
  }
}

enum OrderShowScreenShowMode {
  details,
  phases,
  appointments,
}

