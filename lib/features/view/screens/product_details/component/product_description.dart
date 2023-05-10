

import 'package:flutter/material.dart';
import '../../../../../utils/text_styles/text_styles.dart';

class ProductDescription extends StatefulWidget {
  final String? id;
  final String? description;

  const ProductDescription({this.description, this.id, Key? key})
      : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  String convert = '';

  @override
  Widget build(BuildContext context) {
    

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: TextStyles.subTitle.copyWith(color: Colors.black),
            ),
        
          Text("Essentials Men's Short-Sleeve Crewneck T-Shirt",
          style: TextStyles.bodyText1,
          ),
        
              Text(
                'Category Name.',
                style: TextStyles.bodyText2.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return const Text(
                      "slkdjfa"
                    )
                        // .productImage,
                        // price: productRecommendationState.productRecommendationModel?.product[index].sellingPrice.toString(),
                        ;
                  },
                ),
              ),
            // } else ...{
            //   const Center(child: CupertinoActivityIndicator()),
            // }
          ],
        );
    
  }
}
