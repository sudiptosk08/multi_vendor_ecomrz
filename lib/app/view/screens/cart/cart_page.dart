// import 'package:ecommerce_app/app/view/global_widgets/appBar/app_bar.dart';
// import 'package:ecommerce_app/app/view/global_widgets/gray_handle/gray_handle.dart';
// import 'package:ecommerce_app/app/view/screens/cart/widget/cart_item_list.dart';
// import 'package:ecommerce_app/utils/colors/app_colors.dart';
// import 'package:ecommerce_app/utils/text_styles/text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// import '../../global_widgets/buttons/custom_button.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(60),
//         child: KAppBar(
//           checkTitle: true,
//           title: "Cart",
//         ),
//       ),
//       backgroundColor: AppColors.background,
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: CartItemList(),
//       ),
//       bottomSheet: BottomSheet(
//         animationController: AnimationController.unbounded(vsync: vsync),
//           elevation: 20,
//           onClosing: () => Get.back(),
//           builder: (context) {
//         return Container(
//           height: 80,
//           width: double.infinity,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   height: 200,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       color: AppColors.white,
//                       borderRadius: BorderRadius.circular(8)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         const GrayHandle(),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "SubTotal",
//                               style: TextStyles.bodyText1
//                                   .copyWith(color: AppColors.textgrey),
//                             ),
//                             Text(
//                               "\৳3210",
//                               style: TextStyles.bodyText1,
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Shipping",
//                               style: TextStyles.bodyText1
//                                   .copyWith(color: AppColors.textgrey),
//                             ),
//                             Text(
//                               "\৳100",
//                               style: TextStyles.bodyText1,
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         const Divider(
//                           color: AppColors.textgrey,
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Total",
//                               style: TextStyles.bodyText1,
//                             ),
//                             Text(
//                               "\৳3300",
//                               style: TextStyles.bodyText1,
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               Center(
//                 child: CustomButton(
//                   onTap: () {
//                     Get.back();
//                   },
//                   name: 'Place to Order',
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               )
//             ],
//           ),
//         );
//       }),
// );
//   }
// }
import 'dart:ui';

import 'package:ecommerce_app/app/view/global_widgets/appBar/app_bar.dart';
import 'package:ecommerce_app/app/view/screens/cart/widget/cart_item_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/text_styles/text_styles.dart';
import '../../global_widgets/buttons/custom_button.dart';
import '../../global_widgets/gray_handle/gray_handle.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .45;

    return Material(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: KAppBar(
            checkTitle: true,
            title: "Cart",
          ),
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            SlidingUpPanel(
              maxHeight: _panelHeightOpen,
              minHeight: _panelHeightClosed,
              parallaxEnabled: true,
              parallaxOffset: .5,
              body: _body(),
              panelBuilder: (sc) => _panel(sc),
              // borderRadius: const BorderRadius.only(
              //     topLeft: Radius.circular(18.0),
              //     topRight: Radius.circular(18.0)),
              onPanelSlide: (double pos) => setState(() {
                _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                    _initFabHeight;
                    
              }),
            ),

            // the fab

            // Positioned(
            //     top: 0,
            //     child: ClipRRect(
            //         child: BackdropFilter(
            //             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            //             child: Container(
            //               width: MediaQuery.of(context).size.width,
            //               height: MediaQuery.of(context).padding.top,
            //               color: Colors.transparent,
            //             )))),

            //the SlidingUpPanel Title
          ],
        ),
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const GrayHandle(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "SubTotal",
                                style: TextStyles.bodyText1
                                    .copyWith(color: AppColors.textgrey),
                              ),
                              Text(
                                "\৳3210",
                                style: TextStyles.bodyText1,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Shipping",
                                style: TextStyles.bodyText1
                                    .copyWith(color: AppColors.textgrey),
                              ),
                              Text(
                                "\৳100",
                                style: TextStyles.bodyText1,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: AppColors.textgrey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: TextStyles.bodyText1,
                              ),
                              Text(
                                "\৳3300",
                                style: TextStyles.bodyText1,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: CustomButton(
                    onTap: () {
                      Get.back();
                    },
                    name: 'Place to Order',
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ));
  }

  // Widget _button(String label, IconData icon, Color color) {
  //   return Column(
  //     children: <Widget>[
  //       Container(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Icon(
  //           icon,
  //           color: Colors.white,
  //         ),
  //         decoration:
  //             BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [
  //           BoxShadow(
  //             color: Color.fromRGBO(0, 0, 0, 0.15),
  //             blurRadius: 8.0,
  //           )
  //         ]),
  //       ),
  //       const SizedBox(
  //         height: 12.0,
  //       ),
  //       Text(label),
  //     ],
  //   );
  // }

  Widget _body() {
    return const CartItemList();
  }
}
