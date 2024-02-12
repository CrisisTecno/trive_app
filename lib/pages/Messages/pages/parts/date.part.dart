import 'package:flutter/material.dart';
import 'package:trive_bysc/pages/Diary/widgets/caendar.widget.dart';
import 'package:trive_bysc/pages/Diary/widgets/solicitud_card.dart';
import 'package:trive_bysc/utils/utils.dart';


class DairyDatePart extends StatelessWidget {
  const DairyDatePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 7.h, top: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text('Escoge una fecha',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20.h)),
            ),
            SizedBox(height: 20.h,),
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
