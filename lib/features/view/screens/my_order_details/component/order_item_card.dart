import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            height: 105,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: KColor.textgrey),
              color: KColor.white,
            ),
            child: Row(
              children: [
                Container(
                  width: 98,
                  height: 120,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: AspectRatio(
                    aspectRatio: 0.88,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/3f5a615e22184343bd10af8d008646d7_9366/ultraboost-light-running-shoes.jpg",
                            )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      RichText(
                        maxLines: 3,
                        text: TextSpan(
                            text: "YunKeliu Men Blazer Coat",
                            style: TextStyles.bodyText1),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Color : ",
                                style: TextStyles.bodyText2
                                    .copyWith(color: KColor.textgrey),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text("Gray", style: TextStyles.bodyText2),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Size : ",
                                style: TextStyles.bodyText2
                                    .copyWith(color: KColor.textgrey),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text("L", style: TextStyles.bodyText2),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "Price : ",
                            style: TextStyles.bodyText2
                                .copyWith(color: KColor.textgrey),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text("1050", style: TextStyles.bodyText2),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 3),
              ],
            ),
          )),
    );
  }
}
