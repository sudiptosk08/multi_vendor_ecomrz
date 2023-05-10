import 'package:ecommerce_app/utils/assets/app_assets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/colors/app_colors.dart';
import '../../../../../utils/text_styles/text_styles.dart';
import '../../../global_component/dialog/k_confirm_dialog.dart';

class NotificationCard extends StatefulWidget {
  final String? msg;
  final String? date;
  String? seen;
  final VoidCallback? cancel;
  final VoidCallback? delete;
  NotificationCard({
    this.cancel,
    this.delete,
    this.seen,
    Key? key,
    this.msg,
    this.date,
  }) : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool isSwapToLeft = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   setState(() {
      //     // widget.seen = 0;
      //   });
      // },
      child: Dismissible(
        key: UniqueKey(),
        dragStartBehavior: DragStartBehavior.start,
        movementDuration: const Duration(milliseconds: 200),
        resizeDuration: const Duration(milliseconds: 1000),
        onDismissed: (direction) {
          switch (direction) {
            case DismissDirection.startToEnd:
              break;
            case DismissDirection.endToStart:
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return KConfirmDialog(
                    message: 'Delete product',
                    subMessage:
                        'Are you sure you want to remove this notification?',
                    onCancel: widget.cancel,
                    onDelete: widget.delete,
                  );
                },
              );
              break;
            default:
              break;
          }
        },
        secondaryBackground: _endToStartBackground(),
        background: _startToEndBackground(),
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: KColor.textgrey),
            color: KColor.white,
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  // fit:StackFit.expand,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: KColor.background,
                    ),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: Image.asset(
                        AppAssets.notification,
                        color: KColor.primary,
                        fit: BoxFit.contain,
                        height: 24,
                        width: 24,
                      ),
                    ),
                    if (widget.seen.toString() == "0")
                      Positioned(
                        top: 7,
                        right: 7,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: KColor.black.withOpacity(.8),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        widget.msg.toString(),
                        // style:widget.isRead ? TextStyles.bodyText1.copyWith(color: KColor.blackbg.withOpacity(0.7)):
                        //  TextStyles.bodyText2.copyWith(color: KColor.blackbg.withOpacity(0.7)),
                        style: widget.seen.toString() == "0"
                            ? TextStyles.bodyText2
                            : TextStyles.bodyText1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.date.toString(),
                      style: TextStyles.bodyText3,
                    )
                  ],
                ),
              ),
              //const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Container _startToEndBackground() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      margin: const EdgeInsets.only(top: 10, bottom: 8, left: 2, right: 2),
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            AppAssets.check,
            height: 23,
          ),
        ],
      ),
    );
  }

  Container _endToStartBackground() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      margin: const EdgeInsets.only(top: 10, bottom: 8, left: 2, right: 2),
      decoration: BoxDecoration(
        color: KColor.red,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Icon(Icons.delete)],
      ),
    );
  }
}
