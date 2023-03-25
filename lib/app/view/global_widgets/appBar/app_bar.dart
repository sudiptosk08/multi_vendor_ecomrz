import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/text_styles/text_styles.dart';

class KAppBar extends StatelessWidget {
  final String? title;
  final bool? checkTitle;

  KAppBar({
    this.title,
    this.checkTitle,
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
          : Container(),
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: AppColors.black,
        ),
      ),
      actions: [
        // if (dotCheck == true)
        //   PopupMenuButton(
        //     color: AppColors.black22,
        //     position: PopupMenuPosition.under,
        //     icon: SvgPicture.asset('assets/images/pin.svg'),
        //     itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        //       PopupMenuItem(
        //         child: Text(
        //           'Mark all as read',
        //           style: KTextStyle.bodyText1.copyWith(
        //             color: KColor.blackbg.withOpacity(0.7),
        //           ),
        //         ),
        //       ),
        //       PopupMenuItem(
        //         child: Text(
        //           'Clear all',
        //           style: TextStyle.bodyText1.copyWith(
        //             color: KColor.blackbg.withOpacity(0.7),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
      ],
    );
  }
}
