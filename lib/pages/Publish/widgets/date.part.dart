import 'package:flutter/material.dart';
import 'package:trive_bysc/pages/Diary/widgets/caendar.widget.dart';
import 'package:trive_bysc/pages/Diary/widgets/solicitud_card.dart';
import 'package:trive_bysc/utils/utils.dart';


class DatePart extends StatelessWidget {
  const DatePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 7.h, top: 25.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Container(
                child: CustomCalendar(),
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.h),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffB6B6B6)),
                    borderRadius: BorderRadius.all(Radius.circular(10.h))),
              ),
            ),
          ],
        ));
  }
}
