import 'package:ecommerce_app/features/view/global_component/drawer/drawer.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../global_component/appBar/app_bar.dart';
import '../../global_component/text_field_container/k_search_field.dart';
import '../../global_component/text_field_container/text_field_container.dart';
import '../notification/notification_page.dart';
import 'component/categories_list.dart';
import 'component/new_arrivals_product.dart';
import 'component/popular_products.dart';
import 'component/slider_iamge.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.background,
      drawer: SizedBox(child: KDrawer()),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: KAppBar(
          leading: Builder(builder: (context) {
            return IconButton(
                icon: const Icon(
                  Icons.menu_outlined,
                ),
                iconSize: 25,
                color: Colors.black,
                onPressed: () => Scaffold.of(context).openDrawer());
          }),
          actions: [
            IconButton(
              onPressed: () {
                Helper.dissmissKeyboard();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const NotificationPage())));
              },
              icon: const Icon(
                Icons.notifications_active,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchTextField(
                callbackFunction: (query) {},
                controller: controller,
                readOnly: false,
                hintText: 'Search here...',
              ),
              const SizedBox(
                height: 10,
              ),
              const ImageSlider(),
              const SizedBox(
                height: 10,
              ),
              const CategorySection(),
              const SizedBox(
                height: 10,
              ),
              PopularProduct(),
              const NewArrivalsProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
