import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/Size/sizer.dart';
import 'package:trive_bysc/utils/theme/colors/colors.dart';

class CustomButtonProfile extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final VoidCallback onClick;
  const CustomButtonProfile({
    Key? key,
    required this.title,
    required this.titleColor,
    required this.backgroundColor,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = 400.w;
    double buttomHeight = 50.h;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: primary, width: 1.5.h),
        borderRadius: BorderRadius.circular(20.0),
      ),
      width: buttonWidth,
      height: buttomHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: titleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
        onPressed: onClick,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20.h,
            ),
          ),
        ),
      ),
    );
  }
}
