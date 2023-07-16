import 'package:ecommerce_app/features/view/screens/product/product_page.dart';
import 'package:ecommerce_app/utils/assets/app_assets.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/size/k_size.dart';
import '../../../../../utils/text_styles/text_styles.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int selectIndex = -1;
  List<dynamic> categories = [
    {
      'image': AppAssets.allProduct,
      'name': "All",
    },
    {
      'image': AppAssets.men,
      'name': "Men",
    },
    {
      'image': AppAssets.women,
      'name': "Women",
    },
    {
      'image': AppAssets.shoes,
      'name': "Shoes",
    },
    {
      'image': AppAssets.electronics,
      'name': "Electronics",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: KSize.getHeight(context, 55),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                physics: const BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.fast),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>const ProductPage(),));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: KColor.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 5, top: 5),
                                child: Image.asset(categories[index]['image']),
                              ),
                            ),
                            const SizedBox(
                              width: 1,
                            ),
                            Text(categories[index]['name'],
                                style: TextStyles.bodyText3),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
    );
  }
}
