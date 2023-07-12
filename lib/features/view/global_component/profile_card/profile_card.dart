import 'package:ecommerce_app/utils/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/text_styles/text_styles.dart';

class ProfileCard extends StatelessWidget {
  final String? title;
  final String? image;
  final VoidCallback onPressed;

  const ProfileCard({this.title, this.image, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(color: KColor.background),
        padding: const EdgeInsets.symmetric(vertical: 2),
        width: context.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$title',
                            style: TextStyles.subTitle.copyWith(
                                color: KColor.black54,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: KColor.black54,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: KColor.white,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
