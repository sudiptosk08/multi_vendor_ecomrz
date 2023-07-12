import 'package:ecommerce_app/features/view/screens/filter/filter_page.dart';
import 'package:ecommerce_app/features/view/screens/product_details/product_details_page.dart';
import 'package:ecommerce_app/utils/assets/app_assets.dart';
import 'package:ecommerce_app/utils/size/k_size.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/text_styles/text_styles.dart';
import '../../global_component/appBar/app_bar.dart';
import '../../global_component/product_card.dart/product_card.dart';
import '../../global_component/text_field_container/k_search_field.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  TextEditingController controller = TextEditingController();
  int pageNum = 1;
  bool isPageLoading = false;
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return Scaffold(
          backgroundColor: KColor.background,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: KAppBar(
              checkTitle: true,
              title: 'Shop',
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              actions: const [
                Icon(
                  Icons.access_alarm,
                  color: KColor.background,
                )
              ],
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: KSize.getWidth(context, 290),
                      child: SearchTextField(
                        callbackFunction: (query) {},
                        controller: controller,
                        readOnly: false,
                        hintText: 'Search here...',
                      ),
                    ),
                    const SizedBox(width: 4),
                    Builder(
                      // Wrap GestureDetector with Builder widget
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: Container(
                            width: KSize.getWidth(context, 67),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 14),
                            decoration: BoxDecoration(
                              color: KColor.primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.tune_outlined),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       "Loading ...",
                    //       style: TextStyles.bodyText3
                    //           .copyWith(color: KColor.grey),
                    //     ),
                    //     const SizedBox(
                    //       height: 5,
                    //     ),
                    //     const CircularProgressIndicator(
                    //       color: KColor.grey,
                    //     )
                    //   ],
                    // ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: GridView.builder(
                          padding: EdgeInsets.all(6),
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 3.0,
                            mainAxisSpacing: 2.0,
                            childAspectRatio: 7.5 / 10,
                          ),
                          itemCount: 7,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              id: "",
                              imagePath: AppAssets.product2,
                              productName:
                                  "Mens T-shirt with fabricsi caoton cloths",
                              discountPrice: "12.0",
                              price: "20.35",
                              appDiscount: 0,
                              ratingStar: 5,
                              tap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProductDetailsPage(
                                        description: "Coton Cloths",
                                        id: 1,
                                        price: "1050",
                                        productGroup: "Men",
                                        productName:
                                            "Mens T-shirt with fabricsi caoton cloths",
                                      ),
                                    ));
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
          endDrawer: SizedBox(
            child: KFilter(),
          ),
        );
      },
    );
  }

  _categoryHeader(title, tap) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyles.subTitle,
            ),
            InkWell(
              onTap: tap,
              child: Text(
                'Reset',
                style: TextStyles.bodyText3.copyWith(
                  color: KColor.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
