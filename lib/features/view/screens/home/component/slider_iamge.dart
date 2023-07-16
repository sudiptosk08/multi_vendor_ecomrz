// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:ecommerce_app/utils/assets/app_assets.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/text_styles/text_styles.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  var index;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        key: UniqueKey(),
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: 165,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13))),
        child: Carousel(
          boxFit: BoxFit.cover,

          images: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Stack(
                  children: [
                    Image.asset(
                      AppAssets.banner,
                      width: double.infinity,
                      height: 165,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        top: 24,
                        left: 40,
                        child: Text(
                          "Up To",
                          style: TextStyles.headline4
                              .copyWith(color: KColor.white),
                        )),
                    Positioned(
                        top: 2,
                        left: 40,
                        child: Container(
                          height: 140,
                          width: 200,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                              AppAssets.off60,
                            ),
                          )),
                        )),
                    Positioned(
                        bottom: 25,
                        right: 40,
                        child: SizedBox(
                          width: 256,
                          child: TextButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(KColor.white38)),
                              onPressed: () {},
                              child: const Text("Get it Now")),
                        )),
                  ],
                )),
          ],
          // images: store.state.mainSliderState
          //     .map<Widget>(
          //       (element) => ClipRRect(
          //         borderRadius: BorderRadius.all(Radius.circular(10)),
          //         child: Image.network(
          //           element['image'],
          //           alignment: Alignment.center,
          //           fit: BoxFit.fitHeight,
          //         ),
          //       ),
          //     )
          //     .toList(),
          borderRadius: true,
          dotIncreaseSize: 2,
          radius: const Radius.circular(4),
          dotBgColor: Colors.grey.withOpacity(0.0),
          dotSize: 3,
          autoplay: true,
          autoplayDuration: const Duration(seconds: 3),
          animationCurve: Curves.easeInOut,
        ));
  }
}
