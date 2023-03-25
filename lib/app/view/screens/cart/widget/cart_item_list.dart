import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75 - 50,
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 120,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: AspectRatio(
                        aspectRatio: 0.88,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/3f5a615e22184343bd10af8d008646d7_9366/ultraboost-light-running-shoes.jpg",
                                )),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                            maxLines: 3,
                            text: TextSpan(
                                text: "YunKeliu Men Blazer Coat",
                                style: TextStyles.bodyText1),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                "\৳12.99",
                                style: TextStyles.bodyText2
                                    .copyWith(color: AppColors.textgrey),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                "\৳20.12",
                                style: TextStyles.bodyText2
                                    .copyWith(color: AppColors.primary),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
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
                                          color: AppColors.primary,
                                          borderRadius:
                                              BorderRadius.circular(70),
                                          border: Border.all(
                                              width: 0.5, color: Colors.grey)),
                                      width: 26,
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.remove,
                                        size: 18,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 37,
                                    child: Text(
                                      "1",
                                      style: TextStyles.bodyText1,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(70),
                                        color: AppColors.primary,
                                        border: Border.all(
                                            width: 0.5, color: Colors.grey),
                                      ),
                                      alignment: Alignment.center,
                                      width: 26,
                                      child: const Icon(
                                        Icons.add,
                                        size: 18,
                                        color: AppColors.white,
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
                    const SizedBox(width: 3),
                    Padding(
                      padding: const EdgeInsets.only(top: 11.0),
                      child: Container(
                        width: 25,
                        child: Column(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.grey[700],
                                iconSize: 18,
                                alignment: Alignment.topRight,
                                onPressed: () async {}),
                            const SizedBox(
                              height: 35,
                            ),
                          ],
                        ),
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
