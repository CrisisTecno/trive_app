import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';

class SearchWidget extends StatelessWidget {
  final String label;
  final Icon? icon;
  final Color borderColor;
  final Color borderFocusedColor;
  const SearchWidget({super.key, required this.label,  this.icon, required this.borderColor, required this.borderFocusedColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
    
        prefixIcon: icon != null ? Padding( 
          padding: EdgeInsets.only(right: 8.0), 
          child: icon,
        ) : null,
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.h),
        hintText: label,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
              width: 1,
              color: borderColor), 
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
              width: 2,
              color:borderFocusedColor), 
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
              width: 1,
              color: Colors.red), 
        ),
         
      ),
    );
  }
}
