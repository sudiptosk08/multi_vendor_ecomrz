import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 120,
                width: double.infinity,
                color: AppColors.white,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: AspectRatio(
                        aspectRatio: 0.88,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/3f5a615e22184343bd10af8d008646d7_9366/ultraboost-light-running-shoes.jpg",
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          RichText(
                            maxLines: 3,
                            text: TextSpan(
                                text: "YunKeliu Men Blazer Coat",
                                style: TextStyle(color: Colors.black)
                                // style: KTextStyle.bodyText4
                                //     .copyWith(
                                //   color: store.state
                                //                   .darkModeState ==
                                //               null ||
                                //           store.state
                                //                   .darkModeState ==
                                //               false
                                //       ? Colors.black
                                //       : Colors.grey[400],
                                //   fontSize: 10.5,
                                //),
                                ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: "\৳12.99",
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  text: "\৳20.12",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                          Container(
                            height: 25.5,
                            width: 95,
                            color: Colors.white,
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              
                                              width: 0.5, color: Colors.grey)),
                                      width: 26,
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.remove,
                                        size: 9,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey),
                                      color: Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 37,
                                    child: Text(
                                      "1",
                                      // style: KTextStyle
                                      //     .bodyText4
                                      //     .copyWith(
                                      //         fontWeight:
                                      //             FontWeight
                                      //                 .w300,
                                      //         color:
                                      //             Colors.black),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // setState(() {
                                      //   if (stock !=
                                      //       store.state.cartGetState[
                                      //               index]
                                      //           ['quantity']) {
                                      //     store.state.cartGetState[
                                      //             index]
                                      //         ['quantity']++;
                                      //     getUpdateQty();
                                      //     addSubTotal();
                                      //   } else {
                                      //     return _showMsg(
                                      //         "Product out of Stock!",
                                      //         1);
                                      //   }
                                      // });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5, color: Colors.grey),
                                      ),
                                      alignment: Alignment.center,
                                      width: 26,
                                      child: Icon(
                                        Icons.add,
                                        size: 9,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 3),
                    Container(
                      width: 25,
                      child: Column(
                        children: [
                          IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.grey[700],
                              iconSize: 18,
                              alignment: Alignment.topRight,
                              onPressed: () async {
                                // setState(() {
                                //   //cartList.remove(store.state.cartGetState[index]['id']);
                                //   deleteFromCart();
                                // });
                              }),
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "\৳120",
                            // style: KTextStyle.bodyText4
                            //     .copyWith(
                            //   color: Colors.redAccent,
                            // ),
                          )
                          // : Text(
                          //     "\৳${store.state.cartGetState[index]['details']['sellingPrice'] * store.state.cartGetState[index]['quantity']}",
                          //     style: KTextStyle.bodyText4
                          //         .copyWith(
                          //       color: Colors.redAccent,
                          //     ),
                          //   ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
