import 'package:ecommerce_app/features/view/global_component/buttons/Kdrop_down_field.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../utils/size/k_size.dart';
import '../../../../utils/text_styles/text_styles.dart';

class PopularProductCard extends StatelessWidget {
  const PopularProductCard({
    Key? key,
    this.width = 45,
    this.aspectRatio = 1.02,
    required this.imagePath,
    required this.productName,
    //required this.discount,
    required this.price,
    required this.discountPrice,
    required this.id,
    required this.ratingStar,
    required this.appDiscount,
  }) : super(key: key);

  final double width, aspectRatio;
  //final int discount;
  final int appDiscount;
  final String imagePath;
  final String productName;
  final String price;
  final String discountPrice;
  final String id;
  final int ratingStar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: KSize.getWidth(context, 274),
        decoration: BoxDecoration(
          color: KColor.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Stack(children: [
                  Container(
                    width: KSize.getWidth(context, 125),
                    height: KSize.getWidth(context, 122),
                    decoration: BoxDecoration(
                      color: KColor.grey200!.withOpacity(1),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(7)),
                            image: DecorationImage(
                                image: AssetImage(
                              imagePath,
                            )))),
                  ),
                  Positioned(
                      top: 4,
                      left: 4,
                      child: Text(
                        "$appDiscount% Off",
                        style: TextStyles.bodyText3.copyWith(
                          fontWeight: FontWeight.w600,
                          color: KColor.errorRedText,
                          letterSpacing: 0.3,
                        ),
                      ))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: SizedBox(
                  width: KSize.getWidth(context, 124),
                  height: KSize.getWidth(context, 122),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(right: appDiscount > 0 ? 3.5 : 0),
                        child: Text.rich(TextSpan(
                            text: appDiscount > 0 ? "৳ $discountPrice " : null,
                            style: TextStyles.subTitle.copyWith(
                              color: KColor.errorRedText,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              appDiscount > 0
                                  ? TextSpan(
                                      text: "৳ $price",
                                      style: TextStyles.subTitle.copyWith(
                                        color: KColor.primary,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    )
                                  : TextSpan(
                                      text: "৳ $price",
                                      style: TextStyles.subTitle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: KColor.errorRedText,
                                        letterSpacing: 0.3,
                                      ),
                                    )
                            ])),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star,
                            color: KColor.primary,
                            size: 19,
                          ),
                          Text(
                            "4.9 ",
                            textAlign: TextAlign.center,
                            style: TextStyles.subTitle.copyWith(height: 1.5),
                          ),
                        ],
                      ),
                      Text(
                        productName,
                        textAlign: TextAlign.justify,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.bodyText1,
                      ),
                      KButton(
                        color: KColor.primary,
                        height: 30,
                        width: KSize.getWidth(context, 124),
                        radius: 8,
                        title: "Add to Cart",
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget colorContainer(Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: CircleAvatar(maxRadius: 8, minRadius: 8, backgroundColor: color),
    );
  }
}
