import 'package:ecommerce_app/utils/assets/app_assets.dart';
import 'package:ecommerce_app/utils/size/k_size.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/text_styles/text_styles.dart';
import '../../global_component/appBar/app_bar.dart';

class AllCategoryPage extends StatefulWidget {
  const AllCategoryPage({Key? key}) : super(key: key);

  @override
  State<AllCategoryPage> createState() => _AllCategoryPageState();
}

class _AllCategoryPageState extends State<AllCategoryPage> {
  int selectIndex = 0;
  List<dynamic> category = [
    {'name': 'Bady Dress', 'imagePath': AppAssets.dress},
    {'name': 'Leather Bag', 'imagePath': AppAssets.bag},
    {'name': 'Sweater ', 'imagePath': AppAssets.sweater},
    {'name': 'Boots ', 'imagePath': AppAssets.dress},
    {'name': 'Bady Dress', 'imagePath': AppAssets.dress},
    {'name': 'Bady Dress', 'imagePath': AppAssets.dress},
    {'name': 'Bady Dress', 'imagePath': AppAssets.dress},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: KAppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                }),
            checkTitle: true,
            title: 'Categories'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 2 / 3,
          ),
          itemCount: category.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: KSize.getWidth(context, 90),
                  height: KSize.getHeight(context, 90),
                  decoration: BoxDecoration(
                    color: KColor.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Image.asset(
                      category[index]['imagePath'],
                      height: KSize.getHeight(context, 45),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Flexible(
                  child: Text(
                    category[index]['name'].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyles.bodyText3.copyWith(
                      color: KColor.black,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
