import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trive_bysc/utils/Size/sizer.dart';

class DebitCreditCard extends StatelessWidget {
  final String svgAssetPath;
  final String label;
  const DebitCreditCard({
    Key? key,
    required this.svgAssetPath, required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(horizontal: 25.h,), 
      width: 1000.w,
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical:10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.h),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            svgAssetPath,
            height: 40.h, 
            width: 40.h,
          ),
          SizedBox(width: 15.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 20.h,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
