import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

Future showSheet(
  BuildContext context, {
  required Widget child,
  double maxHeight = 0.75,
  double minHeight = 0.6,
}) {
  return showSlidingBottomSheet(
    context,
    builder: (context) {
      return SlidingSheetDialog(
        cornerRadius: 20,
        snapSpec: SnapSpec(
          snappings: [minHeight, maxHeight],
        ),
        builder: (context, state) {
          return Material(
            child: child,
          );
        },
      );
    },
  );
}
