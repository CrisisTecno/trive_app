import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trive_bysc/utils/utils.dart';

class ChipOptionPublishPrivacity2 extends StatelessWidget {
  final String label;
  const ChipOptionPublishPrivacity2({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      height: 25.h,
      width: 110.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.h)),
          color: primary.withOpacity(0.1)),
      child: Row(
        children: [
          SvgPicture.asset(
            'public/assets/navbar/arroy_back.svg',
            width: 20.h,
            height: 20.h,
          ),
          SizedBox(width: 2),
          Text(
            label,
            style: TextStyle(color: primary),
          ),
        ],
      ),
    );
  }
}
