import 'package:ecommerce_app/app/view/global_widgets/appBar/app_bar.dart';
import 'package:ecommerce_app/app/view/global_widgets/gray_handle/gray_handle.dart';
import 'package:ecommerce_app/app/view/screens/cart/widget/cart_item_list.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../global_widgets/buttons/custom_button.dart';

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const GrayHandle(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SubTotal",
                            style: TextStyles.bodyText1
                                .copyWith(color: AppColors.textgrey),
                          ),
                          Text(
                            "\৳3210",
                            style: TextStyles.bodyText1,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
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
                            "\৳100",
                            style: TextStyles.bodyText1,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: AppColors.textgrey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyles.bodyText1,
                          ),
                          Text(
                            "\৳3300",
                            style: TextStyles.bodyText1,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: CustomButton(
                onTap: () {
                  Get.back();
                },
                name: 'Place to Order',
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
