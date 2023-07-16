import 'package:ecommerce_app/features/view/screens/shop_store_details/component/shop_categroies_product.dart';
import 'package:ecommerce_app/utils/assets/app_assets.dart';
import 'package:ecommerce_app/utils/extension/extension.dart';
import 'package:ecommerce_app/utils/size/k_size.dart';
import 'package:ecommerce_app/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../global_component/appBar/app_bar.dart';

class ShopStoreDetailsPage extends StatefulWidget {
  const ShopStoreDetailsPage(
      {Key? key,
      required this.shopName,
      required this.shopImage,
      required this.shopAddress})
      : super(key: key);
  final String shopName;
  final String shopAddress;
  final String shopImage;

  @override
  State<ShopStoreDetailsPage> createState() => _ShopStoreDetailsPageState();
}

class _ShopStoreDetailsPageState extends State<ShopStoreDetailsPage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  List categories = [
    "All ",
    "Smart Televisions",
    "Ovens",
    "Refrigerators",
    "Freezers",
    "Washing Machinies",
    "Microwaves",
    "LED TV"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: Column(
          children: [
            KAppBar(
              checkTitle: true,
              title: 'Shop Details',
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            Stack(children: [
              SizedBox(
                width: double.infinity,
                height: KSize.getHeight(context, 200),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: KSize.getHeight(context, 120),
                      padding: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          color: KColor.primary.withOpacity(0.2),
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                "assets/images/shopify.PNG",
                              ))),
                    ),
                  ],
                ),
              ),
              Positioned(
                  left: 20,
                  bottom: 0,
                  child: Image.network(
                    widget.shopImage,
                    width: 120,
                    height: 120,
                  )),
              Positioned(
                  right: 20,
                  bottom: 12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.shopName,
                        style: TextStyles.subTitle,
                      ),
                      SmoothStarRating(
                        color: KColor.primary,
                        borderColor: KColor.yellow800,
                      ),
                      Text(
                        widget.shopAddress,
                        style:
                            TextStyles.bodyText1.copyWith(color: KColor.grey),
                      )
                    ],
                  )),
            ]),
          ],
        ),
      ),
      body: DefaultTabController(
        length: categories.length,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              color: KColor.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: TabBar(
                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: KColor.grey,
                      labelColor: KColor.black,
                      isScrollable: true,
                      tabs: [
                        ...List.generate(
                          categories.length,
                          (index) => Padding(
                            padding:
                                const EdgeInsets.only(right: 4.0, left: 4.0),
                            child: Tab(
                              text: categories[index],
                            ),
                          ),
                        ),
                      ],
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.screenHeight * 0.01),
            Expanded(
              child: TabBarView(
                children: [
                  ...List.generate(
                    categories.length,
                    (index) =>
                        ShopCategoriesProduct(OrderStatus: categories[index]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
