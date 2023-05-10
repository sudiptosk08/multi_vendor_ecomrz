import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../../utils/size/k_size.dart';
import '../../../../utils/text_styles/text_styles.dart';
import '../../screens/product_details/product_details_page.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
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
      padding: const EdgeInsets.all(10),
      child: Container(
        width: KSize.getWidth(context, 161),
        height: KSize.getHeight(context, 370),
        decoration: const BoxDecoration(
          color: KColor.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsPage(
                    id: int.parse(id),
                  ),
                ));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 0.79,
                child: Container(
                  width: KSize.getWidth(context, 161),
                  decoration: BoxDecoration(
                      color: KColor.textgrey,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              const SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 1.5),
                          child: SmoothStarRating(
                            size: 14,
                            borderColor: KColor.textgrey,
                            color: Colors.yellow[600],
                            allowHalfRating: false,
                            rating: ratingStar.toDouble(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      productName,
                      maxLines: 2,
                      style: TextStyles.bodyText1,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: appDiscount > 0 ? 3.5 : 0),
                    child: Text.rich(TextSpan(
                        text: appDiscount > 0 ? "৳$discountPrice " : null,
                        style: TextStyles.bodyText3.copyWith(
                          color: KColor.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          appDiscount > 0
                              ? TextSpan(
                                  text: " ৳$price",
                                  style: TextStyles.bodyText3.copyWith(
                                    color: KColor.textgrey,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                )
                              : TextSpan(
                                  text: " ৳$price",
                                  style: TextStyles.bodyText3.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: KColor.primary,
                                    letterSpacing: 0.3,
                                  ),
                                )
                        ])),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
