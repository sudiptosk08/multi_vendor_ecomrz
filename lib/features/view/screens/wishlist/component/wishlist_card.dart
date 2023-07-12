import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/extension/extension.dart';
import 'package:ecommerce_app/utils/size/k_size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../../../global_component/buttons/custom_button.dart';
import '../../../global_component/dialog/k_confirm_dialog.dart';

class WishListCard extends StatefulWidget {
  int? quantity;
  int? productId;
  final String? img;
  final bool? isChecked;
  final String? productName;
  final String? group;
  final int? price;
  int? total;
  final VoidCallback? cancel;
  final VoidCallback? delete;
  final VoidCallback? add;

  WishListCard({
    required this.img,
    required this.productId,
    this.quantity,
    this.isChecked,
    this.productName,
    this.group,
    this.price,
    this.cancel,
    this.delete,
    this.add,
    this.total,
    Key? key,
  }) : super(key: key);

  @override
  State<WishListCard> createState() => _WishListCardState();
}

class _WishListCardState extends State<WishListCard> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      dragStartBehavior: DragStartBehavior.start,
      movementDuration: const Duration(milliseconds: 200),
      resizeDuration: const Duration(milliseconds: 1000),
      onDismissed: (direction) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return KConfirmDialog(
              message: 'Delete product',
              subMessage: 'Are you sure you want to remove this item?"',
              onCancel: widget.cancel,
              onDelete: widget.delete,
            );
          },
        );
      },
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: const BoxDecoration(
          color: KColor.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [Icon(Icons.delete)],
        ),
      ),
      child: Stack(
        children: [
          Container(
            //padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: KColor.white,
                border: Border.all(
                    color: KColor.textgrey.withOpacity(0.4), width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.screenWidth * 0.35,
                  height: context.screenHeight * 0.14,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                      child: Image.asset(
                        '${widget.img}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: KSize.getWidth(context, 205),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.productName}',
                        maxLines: 2,
                        style:
                            TextStyles.bodyText1.copyWith(color: KColor.black),
                      ),
                      Text(
                        '${widget.group}',
                        style: TextStyles.bodyText1
                            .copyWith(color: KColor.black.withOpacity(0.3)),
                      ),
                      SmoothStarRating(
                        color: KColor.primary,
                        borderColor: KColor.primary,
                        size: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "৳${widget.price.toString()}",
                              style: TextStyles.headline4
                                  .copyWith(color: KColor.errorRedText),
                            ),
                            widget.isChecked == true
                                ? InkWell(
                                    onTap: widget.add,
                                    child: CustomButton(
                                      width: 80,
                                      height: 35,
                                      color: KColor.primary,
                                      name: "Buy Now",
                                      onTap: () {},
                                    ))
                                : Row(
                                    children: [
                                      InkWell(
                                        borderRadius: BorderRadius.circular(8),
                                        onTap: () {
                                          setState(() {
                                            widget.quantity =
                                                (widget.quantity! + 1);
                                          });
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: KColor.black, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: const Center(
                                            child: Icon(Icons.add,
                                                size: 10,
                                                color: KColor.textgrey),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Text(
                                          widget.quantity.toString(),
                                          style: TextStyles.headline4.copyWith(
                                            color: KColor.black,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        borderRadius: BorderRadius.circular(8),
                                        onTap: () {
                                          if (widget.quantity! > 1) {
                                            setState(() {
                                              widget.quantity =
                                                  (widget.quantity! - 1);
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: KColor.white, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: const Center(
                                              child: Icon(Icons.remove,
                                                  size: 10,
                                                  color: KColor.black)),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
