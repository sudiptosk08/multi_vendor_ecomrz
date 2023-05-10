import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/text_styles/text_styles.dart';


class KAppBar extends StatelessWidget {
  final String? title;
  final bool checkTitle;
  final List<Widget>? actions;
  final Widget? leading;
  const KAppBar({
    this.title,
    this.checkTitle = false,
    this.actions,
    this.leading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      backgroundColor: KColor.background,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: checkTitle == true
          ? Text('$title', style: TextStyles.appBarText)
          : null,
      elevation: 0,
      leading: leading,
      actions: actions,
    );
  }
}
