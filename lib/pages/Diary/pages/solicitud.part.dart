import 'package:flutter/material.dart';
import 'package:trive_bysc/pages/Diary/widgets/solicitud_card.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../widgets/caendar.widget.dart';

class CalendarPart extends StatelessWidget {
  const CalendarPart({
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
            SizedBox(
              height: 10.h,
            ),
            // SolicitudCard(
            //     profileImageUrl: 'https://s3-alpha-sig.figma.com/img/e02b/88f9/f35cb3fb69f2f16eaad3b201aa2c55dc?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mC5sSQiiM~8mnZaqPN0FE0kKa35TMwtcd7QPEkLZZjRQBFNBYGC5FwOUb3YQI6E9f~xteFrnHQhf9dI6~S6Btepy7KD4mn83Ja-0Io2ZJsCyjW9KG9eUraHMOJlt~p790vfkg2NCw5KEFYxRVvSHGHz11s8RxfFAla2tjA~nfLmHkbMzCjr8mMSrlW5AOxaGawsHE1B1sWR9kv6GXeZNUg8Gb7J02sLTG9JldO-ObYxdfZP2ue7nCyuh7WFTZ4g0ZYvNnBl7khBBwqBd6mUrH-yn4PH6NgTghZn3v4DriteacC~p~jppp3pBToQcgnzNdAihi~JHY6v70W9BHfFCYg__',
            //     name: 'Carlos Mena',
            //     role: 'CEO de Lorem',
            //     meetingTime: '3:00 PM',
            //   )
          ],
        ));
  }
}
