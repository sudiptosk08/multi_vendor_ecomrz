import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/app/view/global_widgets/appBar/app_bar.dart';
import 'package:ecommerce_app/app/view/global_widgets/text_field_container/text_field_container.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: AppColors.primary,
      ),
      appBar: KAppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ) as PreferredSizeWidget,
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
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
          CarouselSlider.builder(
            itemCount: 3,
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              viewportFraction: 0.8,
            ),
            itemBuilder: (context, index, realIndex) => Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: MediaQuery.of(context).size.width - 70,
              color: Colors.pink[(index + 1) * 100],
            ),
          ),
          const Text('Popular Items'),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(10),
                width: 170,
                // height: 350,
                color: Colors.red,
              ),
            ),
          ),
          const Text('Trending Items'),
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(10),
                width: 170,
                // height: 350,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
