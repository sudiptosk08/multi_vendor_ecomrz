import 'package:ecommerce_app/features/view/screens/product_details/product_details_page.dart';
import 'package:ecommerce_app/utils/assets/app_assets.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../../../global_component/product_card.dart/product_card.dart';
import '../../shop/shop_page.dart';

class PopularProduct extends StatefulWidget {
  const PopularProduct({super.key});

  @override
  _PopularProductState createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  List<dynamic> product = [
    {
      'id': 1,
      'imagePath': AppAssets.product1,
      'productName': "Party black dress with janina",
      'price': 240,
      'ratingStar': 5,
      'discountPrice': 0,
      'appDiscount': 0
    },
    {
      'id': 2,
      'imagePath': AppAssets.product2,
      'productName': "Nice t-shirt with is a cotton cloth.",
      'price': 300,
      'ratingStar': 5,
      'discountPrice': 16.50,
      'appDiscount': 0
    },
    {
      'id': 3,
      'imagePath': AppAssets.product3,
      'productName': "Party Dress Black by asduwsl  Black",
      'price': 150,
      'ratingStar': 5,
      'discountPrice': 0,
      'appDiscount': 0
    },
    {
      'id': 4,
      'imagePath': AppAssets.shoe1,
      'productName': "Party Dress Black Party Dress Black",
      'price': 300,
      'ratingStar': 5,
      'discountPrice': 0,
      'appDiscount': 0
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New & Noteworthy",
              style: TextStyles.subTitle,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShopPage()));
              },
              child: Text(
                "View all",
                style: TextStyles.bodyText3.copyWith(color: KColor.secondary),
              ),
            )
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          child: Row(
            children: [
              ...List.generate(
                product.length,
                (index) {
                  return ProductCard(
                    id: product[index]['id'].toString(),
                    imagePath: product[index]['imagePath'],
                    productName: product[index]['productName'],
                    appDiscount: product[index]['appDiscount'],
                    price: product[index]['price'].toString(),
                    ratingStar: product[index]['ratingStar'],
                    discountPrice: product[index]['discountPrice'].toString(),
                    tap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(
                              description: "Coton Cloths",
                              id: product[index]['id'],
                              price: product[index]['price'].toString(),
                              productGroup: "Men",
                              productName: product[index]['productName'],
                            ),
                          ));
                    },
                  );
                  // here by default width and height is 0
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
