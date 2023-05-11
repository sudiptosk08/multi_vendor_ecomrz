import 'package:ecommerce_app/features/view/global_component/text_field_container/k_text_field.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../../../global_component/drop_down/Kdrop_down_field.dart';

class CouponCodeCard extends StatelessWidget {
  // final String? title;
  final String? hintText;
  final String? buttonText;
  final TextEditingController? controller;
  final VoidCallback? tap;
  final bool? readOnly;

  const CouponCodeCard({
    Key? key,
    // this.title,
    this.readOnly,
    this.hintText,
    this.buttonText,
    this.controller,
    this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(title!, style: TextStyles.subTitle),
          const SizedBox(height: 8),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: KFillNormal(
                  controller: controller!,
                  hintText: hintText!,
                  label: "",
                  readOnly: readOnly!,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: KButton(
                  width: double.infinity,
                  height: 45,
                  isOutlineButton: false,
                  radius: 5,
                  color: KColor.primary,
                  textStyle: TextStyles.subTitle.copyWith(
                    color: KColor.white,
                  ),
                  title: buttonText,
                  onPressedCallback: tap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
