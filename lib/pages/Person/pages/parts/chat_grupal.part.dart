import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trive_bysc/pages/Diary/widgets/solicitud_card.dart';
import 'package:trive_bysc/pages/pages.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../Publish/widgets/time_chip.dart';

class ChatPartSelect extends StatelessWidget {
  const ChatPartSelect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 7.h, top: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250.h,
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(20.h))),
                  child: Center(
                    child: SvgPicture.asset(
                      'public/assets/icons/x.svg',
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.h),
                    height: 35.h,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.all(Radius.circular(40.h))),
                    child: Center(
                      child: Text(
                        'Subcribirme',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15.h),
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ],
        ));
  }
}
