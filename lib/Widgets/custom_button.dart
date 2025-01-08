import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Color primaryColor;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  const CustomButton({
    super.key,
    required this.onPressed,
    this.height,
    this.width,
    required this.child,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 5,
        color: primaryColor,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
        height: height,
        minWidth: width,
        onPressed: onPressed,
        child: child);
  }
}
