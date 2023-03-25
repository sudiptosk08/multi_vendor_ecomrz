import 'package:ecommerce_app/app/view/global_widgets/appBar/app_bar.dart';
import 'package:ecommerce_app/app/view/screens/cart/widget/cart_item_list.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: KAppBar(
          checkTitle: true,
          title: "Cart",
        ),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const CartItemList(),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SubTotal",
                          style: TextStyles.bodyText1
                              .copyWith(color: AppColors.textgrey),
                        ),
                        Text(
                          "৳3210",
                          style: TextStyles.bodyText1,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping",
                          style: TextStyles.bodyText1
                              .copyWith(color: AppColors.textgrey),
                        ),
                        Text(
                          "৳100",
                          style: TextStyles.bodyText1,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
