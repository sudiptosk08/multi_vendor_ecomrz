import 'package:flutter/material.dart';
import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/size/k_size.dart';
import '../../../../../utils/text_styles/text_styles.dart';

// ignore: must_be_immutable
class ReportViewCard extends StatefulWidget {
  String orderId;
  String? date;
  String? reason;
  String? image;
  final String? detailstxt;

  ReportViewCard(
      {Key? key,
      required this.orderId,
      this.detailstxt,
      this.reason,
      this.date,
      this.image})
      : super(key: key);

  @override
  _ReportViewCardState createState() => _ReportViewCardState();
}

class _ReportViewCardState extends State<ReportViewCard> {
  int secondaryIndex = -1;
  int primaryIndex = 0;

  void changeIndex(int index) {
    setState(() {
      secondaryIndex = index;
    });
  }

  void changePrimaryIndex(int index) {
    setState(() {
      primaryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (secondaryIndex == -1) {
              secondaryIndex = 0;
            } else {
              setState(() {
                secondaryIndex = -1;
              });
            }
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: KColor.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: KColor.textgrey)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image:
                                                AssetImage("${widget.image}")),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "#OrId${widget.orderId}",
                                      textAlign: TextAlign.justify,
                                      style: TextStyles.bodyText1
                                          .copyWith(color: KColor.primary),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Date: ",
                                      textAlign: TextAlign.justify,
                                      style: TextStyles.bodyText1,
                                    ),
                                    Text(
                                      " ${widget.date}",
                                      textAlign: TextAlign.justify,
                                      style: TextStyles.bodyText2,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Reason: ",
                                      textAlign: TextAlign.justify,
                                      style: TextStyles.bodyText1,
                                    ),
                                    Text(
                                      " ${widget.reason}",
                                      textAlign: TextAlign.justify,
                                      style: TextStyles.bodyText2,
                                      maxLines: 2,
                                    ),
                                  ],
                                )
                              ]),
                          const Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                          )
                        ]),
                  ),
                  if (secondaryIndex == 0)
                    SizedBox(height: KSize.getHeight(context, 7)),
                  if (secondaryIndex == 0)
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            width: 75,
                            height: 85,
                            decoration: BoxDecoration(
                              color: KColor.textgrey,
                              borderRadius: BorderRadius.circular(2),
                              image: DecorationImage(
                                  image: AssetImage(widget.image.toString())),
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Expanded(
                            child: Text(
                              widget.detailstxt!,
                              textAlign: TextAlign.justify,
                              style: TextStyles.bodyText3,
                              maxLines: 6,
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
