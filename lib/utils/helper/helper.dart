import 'package:flutter/material.dart';

class Helper {
  static void dissmissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
