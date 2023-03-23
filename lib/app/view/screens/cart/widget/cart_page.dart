import 'package:ecommerce_app/app/view/screens/cart/widget/cart_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      backgroundColor: Colors.grey[350],
      body: Column(
        children: [
          CartItemList(),
        ],
      ),
    );
  }
}
