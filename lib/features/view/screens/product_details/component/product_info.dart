import 'package:ecommerce_app/features/view/screens/product_details/component/product_description.dart';
import 'package:ecommerce_app/features/view/screens/product_details/component/product_variation.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/text_styles/text_styles.dart';

class ProductInfo extends StatefulWidget {
  final String? productName;
  final String? productGroup;
  final String? price;
  final String? description;
  final String? id;
  final String? userId;
  int quantity;
  final VoidCallback add;
  final VoidCallback remove;

  ProductInfo({
    this.productName,
    this.productGroup,
    this.price,
    this.description,
    this.id,
    this.userId,
    required this.add,
    required this.remove,
    this.quantity = 0,
    Key? key,
  }) : super(key: key);
  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  List<String> items = ["Variations", "Descriptions", "Reviews"];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Essentials Men's Short-Sleeve Crewneck T-Shirt",
                    style: TextStyles.headline6,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, left: 6),
                  decoration: BoxDecoration(
                      color: KColor.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: KColor.textgrey, width: 1)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: widget.add,
                        child:const SizedBox(
                          height: 40,
                          width: 45,
                          child:  Center(
                            child: Icon(
                              Icons.add,
                              size: 25,
                              color: KColor.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22.0),
                        child: Text(
                          widget.quantity.toString(),
                          style: TextStyles.headline6.copyWith(
                            color: KColor.black,
                          ),
                        ),
                      ),
                      InkWell(
                        // When using InkWell check the spalsh effect if its radius matches the container
                        borderRadius: BorderRadius.circular(15),
                        onTap: widget.remove,
                        child:const SizedBox(
                          height: 40,
                          width: 45,
                          child:  Center(
                            child: Icon(
                              Icons.remove,
                              size: 25,
                              color: KColor.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 19),
                  child: IgnorePointer(
                      child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 25,
                        color: KColor.yellow,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "4.9 Rating",
                        style: TextStyles.bodyText1
                            .copyWith(color: KColor.textgrey),
                      )
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 19),
                  child: IgnorePointer(
                      child: Row(
                    children: [
                      const Icon(
                        Icons.brightness_1_sharp,
                        size: 15,
                        color: KColor.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "2.5K+ Reviews",
                        style: TextStyles.bodyText1
                            .copyWith(color: KColor.textgrey),
                      )
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 19),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.brightness_1_sharp,
                        size: 15,
                        color: KColor.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "2K Solds ",
                        style: TextStyles.bodyText1
                            .copyWith(color: KColor.textgrey),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                              // if (index == 1) {
                              //   ref
                              //       .read(
                              //           productRecommendationProvider
                              //               .notifier)
                              //       .fetchProductsRecommendation(
                              //           widget.id.toString());
                              // } else if (index == 2) {
                              //   ref
                              //       .read(reviewsProvider.notifier)
                              //       .fetchProductReviews(widget.id);
                              // }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.only(right: 16),
                              width: 111,
                              height: 40,
                              decoration: BoxDecoration(
                                color: KColor.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  items[index],
                                  style: TextStyles.bodyText1.copyWith(
                                    color: index == currentIndex
                                        ? KColor.black.withOpacity(0.9)
                                        : KColor.textgrey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                /// MAIN BODY
                if (currentIndex == 0) const ProductVariation(),
                if (currentIndex == 1)
                  ProductDescription(id: widget.id.toString()),
                if (currentIndex == 2)
                  const SizedBox(
                    child:  Text("Review List Show here ."),
                  )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
