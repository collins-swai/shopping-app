import 'package:get/get.dart';
import 'package:shopping_app/models/carItem.dart';
import 'package:shopping_app/models/order.dart';

class OrderController extends GetxController {
  List<Order> _orders = [];

  List<Order> get order {
    return [..._orders];
  }

  void addOrder(List<CarItem> cartProducts, double total) {
    _orders.insert(
        0,
        Order(
            orderId: DateTime.now().toString(),
            amount: total,
            products: cartProducts,
            dateTime: DateTime.now()));
    update();
  }
}
