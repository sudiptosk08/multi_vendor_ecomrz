import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/extension/extension.dart';
import 'package:ecommerce_app/utils/size/k_size.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductPreview extends StatefulWidget {
  final String? id;

  const ProductPreview({this.id, Key? key}) : super(key: key);

  @override
  State<ProductPreview> createState() => _ProductPreviewState();
}

class _ProductPreviewState extends State<ProductPreview> {
  final _controller = PageController();
  int selectIndex = 0;
  List<dynamic> productImageList = [
    {
      'url':
          "https://sales.finesselimited.com/uploads/lcS3c3eiOuC5HkhDCy8qNJniUSbgmC2HIskR9e0V.jpg"
    },
    {
      'url':
          "https://sales.finesselimited.com/uploads/lcS3c3eiOuC5HkhDCy8qNJniUSbgmC2HIskR9e0V.jpg"
    },
    {
      'url':
          "https://sales.finesselimited.com/uploads/lcS3c3eiOuC5HkhDCy8qNJniUSbgmC2HIskR9e0V.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(
          12.0,
        ),
        child: Column(
          children: [
            Container(
              height: KSize.getHeight(context, 405),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              padding: const EdgeInsets.only(left: 8, right: 12, bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: productImageList.length,
                      itemBuilder: (context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectIndex = index;
                              _controller.animateToPage(
                                selectIndex,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut,
                              );
                            });
                          },
                          child: Container(
                            height: 54,
                            width: 54,
                            margin: const EdgeInsets.only(bottom: 5),
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: selectIndex == index
                                        ? KColor.primary
                                        : KColor.white)),
                            child: Center(
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                    productImageList[index]['url'].toString(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: context.screenWidth * 0.75,
                          height: 250,
                          padding: const EdgeInsets.only(bottom: 15),
                          child: PageView.builder(
                              itemCount: productImageList.length,
                              controller: _controller,
                              itemBuilder: (ctx, position) {
                                return Image.network(
                                    productImageList[position]['url']);
                              }),
                        ),
                      ),
                      Row(
                        children: [
                          SmoothPageIndicator(
                            controller: _controller,
                            count: productImageList.length,
                            onDotClicked: (index) {
                              setState(() {
                                selectIndex = index;
                                _controller.animateToPage(
                                  selectIndex,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeInOut,
                                );
                              });
                              if (index == selectIndex) {}
                            },
                            effect:  const ExpandingDotsEffect(
                              activeDotColor: KColor.primary,
                              dotColor: KColor.white,
                              dotHeight: 8,
                              dotWidth: 8,
                              radius: 107,
                              spacing: 4,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
        right: 18,
        top: 18,
        child: InkWell(
          onTap: () async {
            // if (!getBoolAsync(isLoggedIn)) {
            //   toast('Please login to continue...',
            //       bgColor: KColor.red);
            //   Navigator.pushNamed(context, '/login');
            // }

            // if (wishlistState is! LoadingState) {
            //   productDetails!.product!.isWishlist
            //       ? await ref
            //           .read(wishlistProvider.notifier)
            //           .deleteWishlist(id: widget.id.toString())
            //       : await ref
            //           .read(wishlistProvider.notifier)
            //           .addWishlist(id: widget.id.toString());
            // }
            // ref
            //     .read(wishlistProvider.notifier)
            //     .fetchWishlistProducts();
          },
          child: Material(
            borderRadius: BorderRadius.circular(32),
            elevation: 4,
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.favorite,
                color: KColor.primary,
                size: 22,
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
