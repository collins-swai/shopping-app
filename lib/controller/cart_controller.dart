import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopping_app/models/carItem.dart';

class CartController extends GetxController {
  Map<int, CarItem> _items = {};

  Map<int, CarItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, carItem) {
      total += carItem.productPrice * carItem.productQuantity;
    });
    return total;
  }

  void addItem(int productId, double price, String title, int quantity) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CarItem(
              id: existingCartItem.id,
              productTitle: existingCartItem.productTitle,
              productQuantity: existingCartItem.productQuantity + 1,
              productPrice: existingCartItem.productPrice));
    } else {
      _items.putIfAbsent(
        productId,
        () => CarItem(
          id: DateTime.now().toString(),
          productTitle: title,
          productPrice: price,
          productQuantity: 1,
        ),
      );
    }
    update();
  }

  void removeItem(int productId) {
    _items.remove(productId);
    update();
  }

  void clear() {
    _items = {};
    update();
  }
}
