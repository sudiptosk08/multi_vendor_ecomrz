import 'package:ecommerce_app/utils/colors/app_colors.dart';
import 'package:ecommerce_app/utils/size/k_size.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/text_styles/text_styles.dart';

class ProductVariation extends StatefulWidget {
  const ProductVariation({super.key});

  @override
  State<ProductVariation> createState() => _ProductVariationState();
}

class _ProductVariationState extends State<ProductVariation> {
  List<TextEditingController> variationControllers = [];

  @override
  Widget build(BuildContext context) {
    // final productDetailsState = ref.watch(productDetailsProvider);
    // final productDetails = productDetailsState is ProductDetailsSuccessState
    //     ? productDetailsState.productDetailsModel
    //     : null;

    // if (productDetailsState is ProductDetailsSuccessState) {
    //   print('build if');
    //   // if (variationControllers.isNotEmpty) variationControllers.clear();
    //   if (variationControllers.isEmpty) {
    //     for (int i = 0;
    //         i < productDetailsState.productDetailsModel!.allVariation!.length;
    //         i++) {
    //       variationControllers.add(TextEditingController());
    //     }
    //     variationControllers = variationControllers.toSet().toList();
    //   }
    // }
    // ref.listen(productDetailsProvider, (_, state) {
    //   print('build listen');
    //   if (state is ProductDetailsSuccessState) {
    //     for (int i = 0;
    //         i < state.productDetailsModel!.allVariation!.length;
    //         i++) {
    //       variationControllers.add(TextEditingController());
    //     }
    //     variationControllers = variationControllers.toSet().toList();
    //   }
    // });

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: 35,
                width: KSize.getWidth(context, 150),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: KColor.textgrey),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Color",
                        style: TextStyles.bodyText1,
                      ),
                      const Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: KColor.textgrey,
                      )
                    ],
                  ),
                )),
            Container(
                height: 35,
                width: KSize.getWidth(context, 150),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: KColor.textgrey),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Size",
                        style: TextStyles.bodyText1,
                      ),
                      const Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: KColor.textgrey,
                      )
                    ],
                  ),
                )),
          ],
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
