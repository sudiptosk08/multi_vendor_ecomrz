import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../main_screen.dart';
import '../../../../utils/size/k_size.dart';
import '../../global_component/appBar/app_bar.dart';
import '../../global_component/buttons/Kdrop_down_field.dart';
import '../../global_component/gray_handle/gray_handle.dart';
import '../checkout/checkout_page.dart';
import 'component/cart_item_list.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: KAppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen(
                                page: 0,
                              )));
                },
                icon: const Icon(Icons.arrow_back_ios)),
            checkTitle: true,
            title: "Cart",
          ),
        ),
        backgroundColor: KColor.background,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const CartItemList(),
              SizedBox(
                height: KSize.getHeight(context, 210),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomSheet: Container(
          height: KSize.getHeight(context, 210),
          decoration: BoxDecoration(border: Border.all(color: KColor.white)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Column(
                  children: [
                    const GrayHandle(),
                    text("SubTotal", "৳3200"),
                    const SizedBox(
                      height: 3,
                    ),
                    text("Shipping", "৳100"),
                    Divider(
                      color: KColor.grey350,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    text("Total", "৳3310"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: KButton(
                  width: double.infinity,
                  height: 40,
                  isOutlineButton: false,
                  radius: 8,
                  color: KColor.primary,
                  textStyle: TextStyles.subTitle.copyWith(
                    color: KColor.black,
                  ),
                  onPressedCallback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckoutPage()));
                  },
                  title: "CheckOut",
                ),
              ),
            ],
          ),
        ));
  }

  text(String title, String price) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.bodyText1,
          ),
          Text(
            price,
            style: TextStyles.bodyText1,
          )
        ],
      ),
    );
  }
}
