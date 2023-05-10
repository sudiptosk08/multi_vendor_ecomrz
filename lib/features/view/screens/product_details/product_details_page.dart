import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helper/helper.dart';
import '../../global_component/appBar/app_bar.dart';
import 'component/add_to_cart.dart';
import 'component/product_info.dart';
import 'component/product_preview.dart';

class ProductDetailsPage extends StatefulWidget {
  final String? productName;
  final String? productGroup;
  final String? price;
  final String? description;
  final int? id;

  const ProductDetailsPage({
    this.productName,
    this.productGroup,
    this.price,
    this.description,
    this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  List<String> items = ["Variations", "Descriptions", "Reviews"];
  int currentIndex = 0;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: KAppBar(
          checkTitle: true,
          title: "Product Details",
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
              onPressed: () {
                Helper.dissmissKeyboard();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ProductPreview(id: widget.id.toString()),
            ProductInfo(
              productName: widget.productName,
              productGroup: widget.productGroup,
              price: widget.price,
              description: widget.description,
              id: widget.id.toString(),
              userId: "12",
              quantity: 1,
              add: () {
                setState(() {
                  quantity++;
                });
              },
              remove: () {
                setState(() {
                  quantity--;
                  if (quantity < 0) {
                    quantity = 0;
                  }
                });
              },
            ),
            AddToCart(
              cart: () {
                // if (!getBoolAsync(isLoggedIn)) {
                //   toast('Please login to continue...', bgColor: KColor.red);
                //   Navigator.pushNamed(context, '/login');
                // }
                // if (cartState is! LoadingState) {
                //   ref.read(cartProvider.notifier).addCart(quantity: quantity);
                //}
              },
            ),
          ],
        ),
      ),
    );
  }
}
