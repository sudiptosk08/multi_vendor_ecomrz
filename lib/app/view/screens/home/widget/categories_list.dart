import 'package:ecommerce_app/app/view/screens/all_categories/all_categories_page.dart';
import 'package:ecommerce_app/utils/assets/app_assets.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

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
      'image': AppAssets.dress,
      'name': "Baby Dress",
    },
    {
      'image': AppAssets.bag,
      'name': "Leather Bag",
    },
    {
      'image': AppAssets.sweater,
      'name': "Sweater",
    },
    {
      'image': AppAssets.boots,
      'name': "Boots",
    },
    {
      'image': AppAssets.dress,
      'name': "Baby Dress",
    },
    {
      'image': AppAssets.bag,
      'name': "Leather Bag",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
      color: AppColors.white,
      width: double.infinity,
      height: KSize.getHeight(context, 195),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyles.subTitle,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllCategoryPage()));
                  },
                  child: Text(
                    "See all",
                    style: TextStyles.bodyText3
                        .copyWith(fontSize: 12, color: AppColors.primary),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 10),
              width: double.infinity,
              height: KSize.getHeight(context, 160),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // // setState(() => selectIndex = index);
                      // ref.read(shopProvider.notifier).fetchShopProductList(
                      //     groupId: categoryData[index].id, categoryId: "", str: "");
                      // Navigator.pushNamed(context, '/shop');
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 16),
                          width: KSize.getWidth(context, 75),
                          height: KSize.getWidth(context, 70),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(categories[index]['image']),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          margin: const EdgeInsets.only(right: 24),
                          child: Text(categories[index]['name'],
                              style: TextStyles.bodyText3),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ]),
    );
  }
}
