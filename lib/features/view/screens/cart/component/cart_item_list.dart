import 'package:ecommerce_app/utils/assets/app_assets.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/extension/extension.dart';
import 'package:ecommerce_app/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

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
        itemCount: 2,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: KColor.textgrey.withOpacity(0.4)),
                color: KColor.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 0.9,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: KColor.greybg,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                        ),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(AppAssets.dress)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: context.screenWidth * 0.52,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        RichText(
                          maxLines: 3,
                          text: TextSpan(
                              text:
                                  "YunKeliu Men Blazer Coat Peheli Nazar Mein",
                              style: TextStyles.bodyText1),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              "৳12.99",
                              style: TextStyles.bodyText2
                                  .copyWith(color: KColor.textgrey),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "৳20.12",
                              style: TextStyles.bodyText2
                                  .copyWith(color: KColor.primary),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Container(
                          height: 25.5,
                          width: 95,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: KColor.primary,
                                      borderRadius: BorderRadius.circular(70),
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey)),
                                  width: 26,
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.remove,
                                    size: 18,
                                    color: KColor.white,
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
                                    borderRadius: BorderRadius.circular(70),
                                    color: KColor.primary,
                                    border: Border.all(
                                        width: 0.5, color: Colors.grey),
                                  ),
                                  alignment: Alignment.center,
                                  width: 26,
                                  child: const Icon(
                                    Icons.add,
                                    size: 18,
                                    color: KColor.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      padding: const EdgeInsets.only(top: 14, right: 14),
                      icon: const Icon(Icons.delete),
                      color: Colors.grey[700],
                      iconSize: 18,
                      alignment: Alignment.topRight,
                      onPressed: () async {}),
                ],
              ),
            )),
      ),
    );
  }
}
