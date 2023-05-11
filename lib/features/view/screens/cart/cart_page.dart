import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../main_screen.dart';
import '../../../../utils/size/k_size.dart';
import '../../global_component/appBar/app_bar.dart';
import '../../global_component/drop_down/Kdrop_down_field.dart';
import '../../global_component/gray_handle/gray_handle.dart';
import '../../global_component/text_field_container/k_text_field.dart';
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
  TextEditingController controller = TextEditingController();
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
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     CouponCodeCard(
              //       controller: promoCode,
              //       readOnly: false,
              //       hintText: 'Promo Code',
              //       buttonText: 'Apply Code',
              //       tap: () {
              //         //   if (codeState is! LoadingState) {
              //         //     ref
              //         //         .read(discountProvider.notifier)
              //         //         .sendPromoCode(code: promoCodeController.text,clear : promoCodeClear );
              //         //     setState(() {
              //         //       promoCodeClear = !promoCodeClear;
              //         //     });
              //         //   }

              //         // if (promoCodeClear == false) {
              //         //   promoCodeController.clear();
              //         // }
              //       },
              //     ),
              //     const SizedBox(height: 17),
              //     CouponCodeCard(
              //       controller: referralCode,
              //       readOnly: false,
              //       // title: 'Gift Voucher',
              //       hintText: 'Gift Voucher',
              //       buttonText: 'Apply Code',
              //       tap: () {
              //         // if (codeState is! LoadingState) {
              //         //   ref.read(discountProvider.notifier).sendCReferralCode(
              //         //       barCode: referralCodeController.text,clear : referralCodeClear );
              //         //   setState(() {
              //         //     referralCodeClear = !referralCodeClear;
              //         //   });
              //         // }
              //         // if (referralCodeClear == false) {
              //         //   referralCodeController.clear();
              //         // }
              //       },
              //     ),
              //     const SizedBox(height: 17),
              //     // if (codeState is ReferralCodeSuccessState) ...[
              //     //   Text(
              //     //     codeState.referralCodeModel!.message.toString(),
              //     //     style: KTextStyle.subtitle2.copyWith(color: KColor.blackbg),
              //     //   ),
              //     const SizedBox(height: 15),
              //   ],
              // ),
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
                        Row(
                          children: [
                            Flexible(
                                flex: 2,
                                child: TextFormField(
                                  // maxLines: widget.maxline,
                                  // minLines: widget.minline,
                                  validator: (value) {
                                    String pattern = r'^[a-z A-Z]';
                                    RegExp regExp = RegExp(pattern);
                                    if (value == null || value.isEmpty) {
                                      return 'Please FillUp';
                                    } else if (!regExp.hasMatch(value)) {
                                      return 'Please enter valid name';
                                    }
                                    return null;
                                  },
                                  readOnly: false,
                                  controller: controller,
                                  decoration: InputDecoration(
                                    hintText: "Promo Code",
                                    hintStyle: TextStyles.bodyText2.copyWith(
                                      color: KColor.textgrey,
                                    ),
                                    labelText: "",
                                    labelStyle: TextStyles.bodyText1.copyWith(
                                      color: KColor.textgrey,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.5)),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(5.0),
                                          bottomLeft: Radius.circular(5.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.5)),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(5.0),
                                          bottomLeft: Radius.circular(5.0)),
                                    ),
                                    filled: true,
                                    fillColor: KColor.white,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                )),
                            Flexible(
                                child: InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              onTap: () {},
                              child: Container(
                                width: double.infinity,
                                height: 47.4,
                                decoration: const BoxDecoration(
                                  color: KColor.primary,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: KSize.getWidth(context, 8)),
                                    Expanded(
                                      //flex: widget.textOverflow == TextOverflow.ellipsis ? 1 : 0,
                                      child: Text(
                                        'Apply',
                                        textAlign: TextAlign.center,
                                        style: TextStyles.bodyText1.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: KColor.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                          ],
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
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
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
