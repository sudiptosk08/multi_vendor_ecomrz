import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../utils/size/k_size.dart';
import '../../../../utils/text_styles/text_styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.discountPrice,
    required this.id,
    required this.ratingStar,
    required this.appDiscount,
    required this.tap,
  }) : super(key: key);

  final int appDiscount;
  final String imagePath;
  final String productName;
  final String price;
  final String discountPrice;
  final String id;
  final VoidCallback? tap;
  final int ratingStar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: KSize.getWidth(context, 152),
        decoration: BoxDecoration(
          color: KColor.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: GestureDetector(
          onTap: tap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.25,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: KColor.grey200!.withOpacity(1),
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                    ),
                    child: Padding(
                        padding:const EdgeInsets.only(left: 10, right: 10, top: 8),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      maxLines: 2,
                      textAlign: TextAlign.justify,
                      style: TextStyles.bodyText1,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: appDiscount > 0 ? 3.5 : 0),
                        child: Text.rich(TextSpan(
                            text: appDiscount > 0 ? "৳ $discountPrice " : null,
                            style: TextStyles.subTitle.copyWith(
                              color: KColor.errorRedText,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              appDiscount > 0
                                  ? TextSpan(
                                      text: " ৳ $price",
                                      style: TextStyles.subTitle.copyWith(
                                        color: KColor.primary,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    )
                                  : TextSpan(
                                      text: " ৳ $price",
                                      style: TextStyles.subTitle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: KColor.errorRedText,
                                        letterSpacing: 0.3,
                                      ),
                                    )
                            ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.star,
                              color: KColor.primary,
                              size: 18,
                            ),
                            Text(
                              "4.9",
                              textAlign: TextAlign.center,
                              style: TextStyles.subTitle.copyWith(height: 1.3),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: KColor.gray,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
