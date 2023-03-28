import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
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
        padding: EdgeInsets.only(left: 10, right: 10),
        height: 174,
        width: double.infinity,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            ExactAssetImage("assets/images/product5.png"),
            ExactAssetImage("assets/images/product2.png"),
            ExactAssetImage("assets/images/product1.png")
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
          radius: Radius.circular(12),
          dotBgColor: Colors.grey.withOpacity(0.0),
          dotSize: 3,
          autoplay: true,
          autoplayDuration: Duration(seconds: 3),
          animationCurve: Curves.easeInOut,
        ));
  }
}
