import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final Icon? icon;
  final Color borderColor;
  final Color borderFocusedColor;
  final TextEditingController controllersc;
  const InputText(
      {super.key,
      required this.label,
      this.icon,
      required this.borderColor,
      required this.borderFocusedColor,
      required this.controllersc});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllersc,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        hintText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 1, color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 2, color: borderFocusedColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        suffixIcon: icon != null
            ? Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: icon,
              )
            : null,
      ),
    );
  }
}
