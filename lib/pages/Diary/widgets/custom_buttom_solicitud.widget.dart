
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trive_bysc/utils/utils.dart';

class ButtonCustomSolicitud extends StatelessWidget {
  final String label;
  final String pathIcon;
  final Color color;
  const ButtonCustomSolicitud({
    super.key,
    required this.label,
    required this.pathIcon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 28.h,
        width: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: color.withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label),
            SizedBox(
              width: 2.h,
            ),
            SvgPicture.asset(pathIcon),
          ],
        ),
      ),
    );
  }
}
