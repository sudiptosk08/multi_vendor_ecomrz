// ignore_for_file: file_names

import 'package:ecommerce_app/utils/assets/app_assets.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../global_component/appBar/app_bar.dart';
import 'component/wishlist_card.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: KAppBar(
          checkTitle: true,
          title: "WishList",
        ),
      ),
      backgroundColor: KColor.background,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              ListView.builder(
                physics: const BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.fast),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return WishListCard(
                    img: AppAssets.product2,
                    productId: 1,
                    isChecked: true,
                    productName:
                        "Party Dress Black Collection with conton mates alk",
                    group: "T-Shirt",
                    price: 1050,
                    cancel: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    delete: () {
                      Navigator.pop(context);
                    },
                    add: () {
                      //if (cartState is! LoadingState) {
                      // ref.read(cartProvider.notifier).addCart(
                      //       product: wishlistData[index].product,
                      //       barCode: "3211",
                      //       quantity: 1,
                      //     );
                      //}
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
