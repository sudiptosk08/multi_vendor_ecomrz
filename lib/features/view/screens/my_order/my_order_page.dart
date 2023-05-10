import 'package:ecommerce_app/utils/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/text_styles/text_styles.dart';
import '../../global_component/appBar/app_bar.dart';
import 'component/specific_order.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: KColor.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: KAppBar(
              checkTitle: true,
              title: 'My Orders',
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios))),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Divider(
                    color: KColor.black.withOpacity(0.1),
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 40,
                    child: TabBar(
                      indicatorColor: KColor.transparent,
                      isScrollable: false,
                      onTap: (value) {
                        setState(() {
                          selectedIndex = value;
                        });
                      },
                      tabs: [
                        Material(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          color: selectedIndex == 0
                              ? KColor.black
                              : KColor.transparent,
                          child: SizedBox(
                            width: 100,
                            height: 35,
                            child: Center(
                              child: Text(
                                "Delivered",
                                style: TextStyles.bodyText1.copyWith(
                                    color: selectedIndex == 0
                                        ? KColor.white
                                        : KColor.black),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          color: selectedIndex == 1
                              ? KColor.black
                              : KColor.transparent,
                          child: SizedBox(
                            width: 100,
                            height: 35,
                            child: Center(
                              child: Text(
                                "Processing",
                                style: TextStyles.bodyText1.copyWith(
                                    color: selectedIndex == 1
                                        ? KColor.white
                                        : KColor.black),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          color: selectedIndex == 2
                              ? KColor.black
                              : KColor.transparent,
                          child: SizedBox(
                            width: 100,
                            height: 35,
                            child: Center(
                              child: Text(
                                "Canceled",
                                style: TextStyles.bodyText1.copyWith(
                                  color: selectedIndex == 2
                                      ? KColor.white
                                      : KColor.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: KColor.black.withOpacity(0.1),
                    thickness: 1,
                  ),
                ],
              ),
            ),
            SizedBox(height: context.screenHeight * 0.01),
            const Expanded(
              child: TabBarView(
                children: [
                  SpecificOrder(OrderStatus: "Delivered"),
                  SpecificOrder(OrderStatus: "Processing"),
                  SpecificOrder(OrderStatus: "Canceled"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
