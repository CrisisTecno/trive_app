import 'package:flutter/material.dart';
import '../../utils/utils.dart';
class CustomButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final VoidCallback onClick;
  const CustomButton({
    Key? key,
    required this.title,
    required this.titleColor,
    required this.backgroundColor,
    required this.onClick, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = 400.w;
    double buttomHeight = 60.h;
    return  SizedBox(
      width: buttonWidth,
      height:buttomHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, 
          foregroundColor: titleColor, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), 
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          
        ),
        onPressed: onClick,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16.0, 
          ),
        ),
      ),
    );
  }
}
