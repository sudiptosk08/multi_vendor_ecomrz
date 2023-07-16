// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/utils/assets/app_assets.dart';
import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/text_styles/text_styles.dart';
import '../../../global_component/dialog/k_confirm_dialog.dart';

class ShippingAddressCard extends StatefulWidget {
  bool isChecked;
  final String? userName;
  final String? address;
  final String? city;
  final String? zone;
  final String? area;
  final VoidCallback? cancel;
  final VoidCallback? delete;
  final VoidCallback? add;

  ShippingAddressCard({
    this.isChecked = false,
    this.userName,
    this.address,
    this.city,
    this.zone,
    this.area,
    this.cancel,
    this.delete,
    this.add,
    Key? key,
  }) : super(key: key);

  @override
  State<ShippingAddressCard> createState() => _ShippingAddressCardState();
}

class _ShippingAddressCardState extends State<ShippingAddressCard> {
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
              subMessage: 'Are you sure you want to delete this product?',
              onCancel: widget.cancel,
              onDelete: widget.delete,
            );
          },
        );
      },
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        margin: const EdgeInsets.only(bottom: 4),
        decoration: const BoxDecoration(
          color: KColor.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:const [Icon(Icons.delete)],
        ),
      ),
      child: Container(
        //padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 4),
        height: 123,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: KColor.white,
            border:
                Border.all(color: KColor.textgrey.withOpacity(0.4), width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            '${widget.userName}',
                            style: TextStyles.bodyText1
                                .copyWith(color: KColor.black),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${widget.address}',
                          style: TextStyles.bodyText1
                              .copyWith(color: KColor.black54),
                        ),
                        Row(
                          children: [
                            Text('${widget.city}, ',
                                style: TextStyles.bodyText1
                                    .copyWith(color: KColor.black54)),
                            Text(
                              '${widget.zone}, ',
                              style: TextStyles.bodyText1
                                  .copyWith(color: KColor.black54),
                            ),
                            Text(
                              '${widget.area}',
                              style: TextStyles.bodyText1
                                  .copyWith(color: KColor.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.isChecked = !widget.isChecked;
                          });
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: widget.isChecked
                                ? KColor.black
                                : KColor.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: KColor.black, width: 1),
                          ),
                          child: widget.isChecked
                              ? Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Image.asset(AppAssets.check),
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Use as the shipping address",
                        style: TextStyles.bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: KColor.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
