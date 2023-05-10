import 'package:ecommerce_app/features/view/screens/shop/shop_page.dart';
import 'package:ecommerce_app/utils/assets/app_assets.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../../../global_component/product_card.dart/product_card.dart';

class NewArrivalsProduct extends StatefulWidget {
  const NewArrivalsProduct({super.key});

  @override
  _NewArrivalsProductState createState() => _NewArrivalsProductState();
}

class _NewArrivalsProductState extends State<NewArrivalsProduct> {
  List<dynamic> product = [
    {
      'id': 1,
      'imagePath': AppAssets.product5,
      'productName': "Party Dress Black qpuzid idhaihe kjslkd",
      'price': 24.00,
      'ratingStar': 5,
      'discountPrice': 0,
      'appDiscount': 0
    },
    {
      'id': 2,
      'imagePath': AppAssets.product2,
      'productName': "Party Dress Black liaud iuweyr klasdl",
      'price': 24.00,
      'ratingStar': 5,
      'discountPrice': 0,
      'appDiscount': 0
    },
    {
      'id': 3,
      'imagePath': AppAssets.sweater,
      'productName': "Party Dress Black asraf hosainlk adsl",
      'price': 24.00,
      'ratingStar': 5,
      'discountPrice': 0,
      'appDiscount': 0
    },
    {
      'id': 4,
      'imagePath': AppAssets.dress,
      'productName': "Party Dress Black Uhouas Jidhai Ieasl",
      'price': 24.00,
      'ratingStar': 5,
      'discountPrice': 0,
      'appDiscount': 0
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New Arrival",
              style: TextStyles.subTitle,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShopPage()));
              },
              child: Text(
                "See all",
                style: TextStyles.bodyText3.copyWith(color: KColor.primary),
              ),
            )
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(
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
                      //discount: store.state.PopularProductState[index]['discount'],
                      appDiscount: product[index]['appDiscount'],
                      price: product[index]['price'].toString(),
                      ratingStar: product[index]['ratingStar'],
                      discountPrice:
                          product[index]['discountPrice'].toString());
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
