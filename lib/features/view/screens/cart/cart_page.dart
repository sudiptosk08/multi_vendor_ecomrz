import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../main_screen.dart';
import '../../../../utils/size/k_size.dart';
import '../../global_component/appBar/app_bar.dart';
import '../../global_component/drop_down/Kdrop_down_field.dart';
import '../../global_component/gray_handle/gray_handle.dart';
import '../checkout/checkout_page.dart';
import 'component/cart_item_list.dart';
import 'component/cupon_card.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TextEditingController promoCode = TextEditingController();
  TextEditingController referralCode = TextEditingController();
  TextEditingController giftVoucherCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: KAppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CouponCodeCard(
                  controller: promoCode,
                  readOnly: false,
                  title: 'Promo Code',
                  hintText: 'Promo Code',
                  // buttonText: promoCodeData?.success == true &&
                  //         promoCodeController.text.isNotEmpty
                  //     ? 'Clear'
                  //     :
                  buttonText: 'Apply Code',
                  tap: () {
                    //   if (codeState is! LoadingState) {
                    //     ref
                    //         .read(discountProvider.notifier)
                    //         .sendPromoCode(code: promoCodeController.text,clear : promoCodeClear );
                    //     setState(() {
                    //       promoCodeClear = !promoCodeClear;
                    //     });
                    //   }

                    // if (promoCodeClear == false) {
                    //   promoCodeController.clear();
                    // }
                  },
                ),
                const SizedBox(height: 17),
                CouponCodeCard(
                  controller: referralCode,
                  readOnly: false,
                  title: 'Gift Voucher',
                  hintText: 'Gift Voucher',
                  buttonText: 'Apply Code',
                  tap: () {
                    // if (codeState is! LoadingState) {
                    //   ref.read(discountProvider.notifier).sendCReferralCode(
                    //       barCode: referralCodeController.text,clear : referralCodeClear );
                    //   setState(() {
                    //     referralCodeClear = !referralCodeClear;
                    //   });
                    // }
                    // if (referralCodeClear == false) {
                    //   referralCodeController.clear();
                    // }
                  },
                ),
                const SizedBox(height: 17),
                // if (codeState is ReferralCodeSuccessState) ...[
                //   Text(
                //     codeState.referralCodeModel!.message.toString(),
                //     style: KTextStyle.subtitle2.copyWith(color: KColor.blackbg),
                //   ),
                const SizedBox(height: 15),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: KColor.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const GrayHandle(),
                      text("SubTotal", "৳3200"),
                      const SizedBox(
                        height: 5,
                      ),
                      text("Shipping", "৳100"),
                      const SizedBox(
                        height: 5,
                      ),
                      text("Discount", "20%"),
                      const SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: KColor.grey350,
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      text("Total", "৳3310"),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: KButton(
                width: double.infinity,
                height: 40,
                isOutlineButton: false,
                radius: 10,
                color: KColor.primary,
                textStyle: TextStyles.subTitle.copyWith(
                  color: KColor.white,
                ),
                onPressedCallback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckoutPage()));
                },
                title: "Place to Order",
              ),
            ),
          ],
        ),
      ),
    );
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
