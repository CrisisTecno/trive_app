import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trive_bysc/utils/Size/sizer.dart';
import 'package:trive_bysc/utils/theme/colors/colors.dart';

class CustomInputField extends StatelessWidget {
  final VoidCallback onMicTap;
  final VoidCallback onPlusTap;

  const CustomInputField({
    Key? key,
    required this.onMicTap,
    required this.onPlusTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        Size window = MediaQuery.of(context).size;
    return SizedBox(
      width: window.width,
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color:primary,width: 1.h ),
              borderRadius: BorderRadius.circular(8),
           
            ),
            child: Row(
              children: [
                SizedBox(width:5.h),
                InkWell(
                  onTap: onMicTap,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: SvgPicture.asset(
                      'public/assets/icons/mic.svg',
                      width: 24.h, // Tamaño del icono
                    ),
                  ),
                ),
                
                SizedBox(
                  width: window.width*0.55,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onPlusTap,
            child: Container(
              width: window.width*0.2,
              margin:  EdgeInsets.only(left: 12),
              padding: EdgeInsets.symmetric(horizontal: 12.h,vertical: 10.h),
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                      'public/assets/icons/thunder_blank.svg',
                      width: 20.h, 
                    ),
                  SizedBox(width: 4),
                  Text(
                    '20',
                    style: TextStyle(
                      fontSize: 20.h,
                      color: Colors.white,fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
