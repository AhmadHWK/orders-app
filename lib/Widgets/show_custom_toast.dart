import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void showCustomToast({
  required String message,
  ToastGravity gravity = ToastGravity.TOP,
  Color backgroundColor = const Color(0xff4A90E2),
  Color textColor = Colors.white,
  double fontSize = 16.0,
}) {
  Fluttertoast.showToast(
    msg: message,
    gravity: gravity,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: fontSize,
  );
}
