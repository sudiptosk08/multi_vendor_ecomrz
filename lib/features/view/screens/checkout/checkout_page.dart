import 'package:ecommerce_app/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import '../../../../utils/assets/app_assets.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/size/k_size.dart';
import '../../../../utils/text_styles/text_styles.dart';
import '../../global_component/appBar/app_bar.dart';
import '../../global_component/drop_down/Kdrop_down_field.dart';
import '../shipping_address/shipping_address_page.dart';
import 'component/cart_item_list.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? paymentSelect;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: KAppBar(
            checkTitle: true,
            title: 'Checkout',
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios))),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SvgPicture.asset('assets/images/stepper_three.svg'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SelectedItems(),
                  Container(
                    padding: const EdgeInsets.all(14),
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: KColor.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Shipping Info',
                                      style: TextStyles.subTitle
                                          .copyWith(color: KColor.black),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ShippingAddressPage()));
                                        },
                                        icon: const Icon(Icons.edit)),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Sudipto Sarker',
                                  style: TextStyles.bodyText1.copyWith(
                                      color: KColor.black.withOpacity(0.6)),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '01758039342',
                                  style: TextStyles.bodyText1.copyWith(
                                      color: KColor.black.withOpacity(0.6)),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Sylhet Sardar, Sylhet , Bangladesh",
                                  style: TextStyles.bodyText1.copyWith(
                                      color: KColor.black.withOpacity(0.6)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Payment', style: TextStyles.subTitle),
                            SizedBox(height: KSize.getHeight(context, 16)),
                            Container(
                              height: KSize.getHeight(context, 60),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: KColor.background),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: KSize.getWidth(context, 10)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    value: paymentSelect,
                                    hint: Text("Payment Method"),
                                    dropdownColor: KColor.background,
                                    items: [
                                      {
                                        'name': "Cash On Delivery",
                                        'image': AppAssets.cod
                                      },
                                      {
                                        'name': "bkash",
                                        'image': AppAssets.bkash
                                      },
                                      {
                                        'name': "Nagod",
                                        'image': AppAssets.nagad
                                      },
                                    ].map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value.toString(),
                                        child: Container(
                                          width: 305,
                                          decoration: const BoxDecoration(
                                            color: KColor.background,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: KSize.getWidth(
                                                    context, 3.0)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${value['name']}",
                                                  style: TextStyles.bodyText1
                                                      .copyWith(
                                                          color: KColor.black),
                                                ),
                                                Image.asset(
                                                    "${value['image']}"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        paymentSelect = value;
                                        // print("price is :${priceString}");
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: KColor.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            text("SubTotal", "৳3200"),
                            const SizedBox(
                              height: 8,
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
                              height: 5,
                            ),
                            text("Total", "৳3310"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // CardTotal(),
                ],
              ),
              SizedBox(height: context.screenHeight * 0.1),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
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
          onPressedCallback: () {},
          title: "Place to Order",
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
