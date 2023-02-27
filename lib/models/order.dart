import 'package:shopping_app/models/carItem.dart';

class Order {
  final String orderId;
  final double amount;
  final List<CarItem> products;
  final DateTime dateTime;

  Order(
      {required this.orderId,
      required this.amount,
      required this.products,
      required this.dateTime});
}
