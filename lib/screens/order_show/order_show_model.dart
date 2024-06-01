import 'package:untitled5/screens/order_show/widgets/phases_widget.dart';

class OrderShowScreenModel {
  static Future<OrderDetails> getOrderDetails() async {
    OrderDetails myOrder;
    await Future.delayed(const Duration(seconds: 2));
    myOrder = OrderDetails(
        imagesURL: [
          'https://via.placeholder.com/400x200/FF0000/FFFFFF?text=Image+1',
          'https://via.placeholder.com/400x200/00FF00/FFFFFF?text=Image+2',
          'https://via.placeholder.com/400x200/0000FF/FFFFFF?text=Image+3',
        ],
        clientName: 'clientName',
        clientPhone: '0982154430',
        size: '38',
        fabricType: 'cotton',
        height: 'Short',
        color: 'Purple',
        phasesInfo: [
          PhaseInfo('cut', true),
          PhaseInfo('Plot', true),
          PhaseInfo("Assemble", false),
        ]);

    return myOrder;
  }
}

class OrderDetails {
  String clientName, clientPhone, size, fabricType, height, color;
  List<String> imagesURL;
  List<PhaseInfo> phasesInfo;

  OrderDetails({
    required this.imagesURL,
    required this.clientName,
    required this.clientPhone,
    required this.size,
    required this.fabricType,
    required this.height,
    required this.color,
    required this.phasesInfo,
  });
}
