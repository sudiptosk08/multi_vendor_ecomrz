import 'package:ecommerce_app/app/view/global_widgets/appBar/app_bar.dart';
import 'package:ecommerce_app/app/view/global_widgets/text_field_container/text_field_container.dart';
import 'package:ecommerce_app/app/view/screens/home/widget/categories_list.dart';
import 'package:ecommerce_app/app/view/screens/home/widget/new_arrivals_product.dart';
import 'package:ecommerce_app/app/view/screens/home/widget/popular_products.dart';
import 'package:ecommerce_app/app/view/screens/home/widget/slider_iamge.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/text_styles/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Helper.dissmissKeyboard(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        drawer: const Drawer(
          backgroundColor: AppColors.primary,
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: KAppBar(
            leading: IconButton(
              onPressed: () {
                Helper.dissmissKeyboard();
              },
              icon: const Icon(
                Icons.menu,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Helper.dissmissKeyboard();
                },
                icon: const Icon(
                  Icons.notifications_active,
                ),
              ),
              IconButton(
                onPressed: () {
                  Helper.dissmissKeyboard();
                  Get.toNamed(Routes.cartPage);
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                const TextFieldContainer(
                  hint: 'Search',
                  radius: 20,
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ImageSlider(),
                const SizedBox(
                  height: 20,
                ),
                const CategorySection(),
                PopularProduct(),
                NewArrivalsProduct(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
