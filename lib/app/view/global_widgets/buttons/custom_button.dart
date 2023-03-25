import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/text_styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.name, this.onTap});
  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 60,
        decoration: BoxDecoration(
            color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            name,
            style: TextStyles.mediumPoppins24white,
          ),
        ),
      ),
    );
  }
}
