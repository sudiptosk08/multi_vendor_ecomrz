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
    return Scaffold(
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
      body: DefaultTabController(
        length: 3,
        child: Column(
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
                  const SizedBox(
                    height: 40,
                    child: TabBar(
                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: KColor.grey,
                      labelColor: KColor.black,
                      isScrollable: true,
                      labelPadding: EdgeInsets.only(right: 24),
                      tabs: [
                        Padding(
                          padding: EdgeInsets.only(right: 12.0, left: 12.0),
                          child: Tab(
                            text: 'Delivered',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 12.0, left: 12.0),
                          child: Tab(
                            text: 'Processing',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 12.0, left: 12.0),
                          child: Tab(
                            text: 'Canceled',
                          ),
                        ),
                      ],
                      indicatorSize: TabBarIndicatorSize.tab,
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
