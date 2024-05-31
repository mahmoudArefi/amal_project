class OrdersShowScreenModel {
  static Future<List<OrderOverViewDetails>> getOrdersFromBackEnd() async {
    List<OrderOverViewDetails> orders = [];
    await Future.delayed(const Duration(seconds: 2));
    orders.add(OrderOverViewDetails(
        imageURU: 'assets/images/img.png',
        orderName: "mahmoud arefi",
        deliverData: '11/4/2021',
        appointments: '11/4/2022',
        isOrderReady: true));
    return orders;
  }
}

class OrderOverViewDetails {
  String imageURU, orderName, deliverData, appointments;

  bool isOrderReady;

  OrderOverViewDetails(
      {required this.imageURU,
      required this.orderName,
      required this.deliverData,
      required this.appointments,
      required this.isOrderReady});
}
