import 'package:get/get.dart';
import 'package:untitled5/screens/orders_show/orders_show_screen_model.dart';

class OrderShowScreenController extends GetxController {
  RxList<OrderOverViewDetails> ordersFromBackEnd = <OrderOverViewDetails>[].obs;
  RxBool isDoneLoading = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    ordersFromBackEnd.value =await OrdersShowScreenModel.getOrdersFromBackEnd();
    isDoneLoading.value = true ;
  }
}
