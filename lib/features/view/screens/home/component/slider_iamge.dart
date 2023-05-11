import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';

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
        height: 174,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Carousel(
          boxFit: BoxFit.cover,

          images: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: Image.asset(
                  "assets/images/product5.png",
                  fit: BoxFit.cover,
                )),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: Image.asset(
                "assets/images/product2.png",
                fit: BoxFit.cover,
              ),
            ),
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: Image.asset(
                  "assets/images/product1.png",
                  fit: BoxFit.cover,
                ))
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
