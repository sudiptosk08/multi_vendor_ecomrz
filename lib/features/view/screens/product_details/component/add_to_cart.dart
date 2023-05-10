import 'package:ecommerce_app/utils/extension/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';

class AddToCart extends StatefulWidget {
  final VoidCallback cart;

  AddToCart({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.10,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration:const BoxDecoration(
          border: Border(top: BorderSide(color: KColor.textgrey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price',
                  style: TextStyles.bodyText2.copyWith(
                      fontWeight: FontWeight.w700, color: KColor.textgrey),
                ),
                Text(
                  '৳1050',
                  style: TextStyles.headline4.copyWith(
                      color: KColor.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          
          InkWell(
            onTap: widget.cart,
            child: Container(
              height: 45,
              width: context.screenWidth * 0.50,
              decoration: BoxDecoration(
                  color: KColor.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_checkout_outlined,
                    color: KColor.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Add to cart',
                    style: TextStyles.subTitle.copyWith(color: KColor.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
