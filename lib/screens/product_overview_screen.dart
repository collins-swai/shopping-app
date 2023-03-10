import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:shopping_app/controller/cart_controller.dart';
import 'package:shopping_app/screens/productgrid.dart';

class ProductOverviewPage extends StatelessWidget {
  const ProductOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          GetBuilder<CartController>(
              init: CartController(),
              builder: (context) {
                return Badge(
                  child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Get.to(() => CartScreen());
                      }),
                  label: Text(cartController.itemCount.toString()),
                  textColor: Theme.of(context as BuildContext).accentColor,
                );
              })
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(),
    );
  }
}
