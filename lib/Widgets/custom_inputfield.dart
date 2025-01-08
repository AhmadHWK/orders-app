import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final Color primaryColor;
  final String hintText;
  final Icon icon;
  final bool isPhone;
  final bool suffixIcon;
  final bool prefixIcon;
  final bool obscureText;
  final bool validator;
  final TextEditingController? controller;

  const CustomInputField({
    super.key,
    this.isPhone = false,
    required this.hintText,
    this.suffixIcon = false,
    this.obscureText = false,
    this.controller,
    this.prefixIcon = false,
    required this.icon,
    this.validator = false,
    required this.primaryColor,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.isPhone ? TextInputType.number : TextInputType.text,
      textAlign: TextAlign.end,
      obscureText: (widget.obscureText && _obscureText),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: widget.primaryColor, width: 1.5)),
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontSize: 15),
        suffixIconColor: widget.primaryColor,
        suffixIcon: widget.suffixIcon ? widget.icon : null,
        prefixIconColor: widget.primaryColor,
        prefixIcon: widget.prefixIcon
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (textValue) {
        if (textValue == null || textValue.isEmpty) {
          return 'الحقل فارغ';
        }
        if (widget.isPhone && textValue.length < 10) {
          return 'يجب إدخال 10 أرقام';
        }
        return null;
      },
      controller: widget.controller,
    );
  }
}
