import 'package:ecommerce_app/utils/assets/app_assets.dart';

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
            ),
          ),
          body: Container(
            margin: const EdgeInsets.only(left: 12, right: 12),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 9,
                        child: SearchTextField(
                          callbackFunction: (query) {},
                          controller: controller,
                          readOnly: false,
                          hintText: 'Search here...',
                        ),
                      ),
                      const SizedBox(width: 14),
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: KColor.background.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:
                              const Center(child: Icon(Icons.filter_vintage_sharp)),
                        ),
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
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 3.0,
                              mainAxisSpacing: 2.0,
                              childAspectRatio: 5.9 / 10,
                            ),
                            itemCount: 4,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return const ProductCard(
                                id: "",
                                imagePath: AppAssets.product2,
                                productName:
                                    "Sliasd Kuasd wuiso shamq jueos wua",
                                discountPrice: "12.0",
                                price: "20.35",
                                appDiscount: 0,
                                ratingStar: 5,
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
