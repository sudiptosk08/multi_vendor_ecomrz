import 'package:flutter/material.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/text_styles/text_styles.dart';

// ignore: must_be_immutable
class KFillNormal extends StatefulWidget {
  final String label;
  final String hintText;
  final bool readOnly;
   int? maxline;
   int? minline;

  KFillNormal({
    Key? key,
    required this.label,
    required this.controller,
    required this.hintText,
    required this.readOnly,
     this.maxline,
     this.minline,
  }) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  State<KFillNormal> createState() => _KFillNormalState();
}

class _KFillNormalState extends State<KFillNormal> {
  final FocusNode _focusNode = FocusNode();
  Color _color = KColor.background.withOpacity(0.8);

  @override
  // ignore: must_call_super
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _color = Colors.transparent;
        });
      } else {
        setState(() {
          _color = KColor.white;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxline,
      minLines: widget.minline,
      validator: (value) {
        String pattern = r'^[a-z A-Z]';
        RegExp regExp = RegExp(pattern);
        if (value == null || value.isEmpty) {
          return 'Please FillUp';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter valid name';
        }
        return null;
      },
      readOnly: widget.readOnly,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: _focusNode.hasFocus
            ? TextStyles.bodyText2.copyWith(
                color: KColor.textgrey,
              )
            : TextStyles.bodyText2.copyWith(
                color: KColor.textgrey,
              ),
        labelText: widget.label,
        labelStyle: TextStyles.bodyText1.copyWith(
          color: KColor.textgrey,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: KColor.textgrey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        filled: true,
        fillColor: KColor.white,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      focusNode: _focusNode,
    );
  }
}
