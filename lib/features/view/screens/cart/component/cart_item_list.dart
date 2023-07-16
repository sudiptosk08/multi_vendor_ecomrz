import 'package:ecommerce_app/utils/assets/app_assets.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/extension/extension.dart';
import 'package:ecommerce_app/utils/size/k_size.dart';
import 'package:ecommerce_app/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: KColor.textgrey.withOpacity(0.4)),
                color: KColor.white,
              ),
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    border: Border.all(color: KColor.textgrey.withOpacity(0.4)),
                    color: KColor.primary.withOpacity(0.2),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.store_mall_directory_outlined,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: KSize.getWidth(context, 305),
                          child: Text(
                            "Opera ShoppingMall ",
                            style: TextStyles.subTitle,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ...List.generate(
                    2,
                    (index) => Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: KColor.textgrey.withOpacity(0.4)),
                              color: KColor.white),
                          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  width: KSize.getWidth(context, 125),
                                  height: KSize.getHeight(context, 105),
                                  decoration: BoxDecoration(
                                    color: KColor.grey200!.withOpacity(1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(7)),
                                  ),
                                  child: Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                            AppAssets.shoe3,
                                          )))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: context.screenWidth * 0.38,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "YunKeliu Men Blazer Coat Peheli Nazar Mein",
                                          style: TextStyles.bodyText1),
                                      const SizedBox(height: 2),
                                      Row(
                                        children: [
                                          Text(
                                            "৳20.12",
                                            style: TextStyles.bodyText1
                                                .copyWith(
                                                    color: KColor.errorRedText),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Container(
                                        width: 115,
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: KColor.primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            70),
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Colors.grey)),
                                                width: 35,
                                                height: 35,
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                  Icons.remove,
                                                  size: 18,
                                                  color: KColor.black,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              alignment: Alignment.center,
                                              width: 37,
                                              child: Text(
                                                "1",
                                                style: TextStyles.bodyText1,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(70),
                                                  color: KColor.primary,
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey),
                                                ),
                                                alignment: Alignment.center,
                                                width: 35,
                                                height: 35,
                                                child: const Icon(
                                                  Icons.add,
                                                  size: 18,
                                                  color: KColor.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                  padding:
                                      const EdgeInsets.only(top: 8, right: 8),
                                  icon: const Icon(Icons.delete),
                                  color: Colors.grey[700],
                                  iconSize: 18,
                                  alignment: Alignment.topRight,
                                  onPressed: () {}),
                            ],
                          ),
                        )),
              ]),
            )),
      ),
    );
  }
}
