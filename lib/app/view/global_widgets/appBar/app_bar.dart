import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/text_styles/text_styles.dart';

class KAppBar extends StatelessWidget {
  final String? title;
  final bool checkTitle;
  final List<Widget>? actions;

  const KAppBar({
    this.title,
    this.checkTitle = false,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: checkTitle == true
          ? Text('$title', style: TextStyles.appBarText)
          : null,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: AppColors.black,
        ),
      ),
      actions: actions,
    );
  }
}
