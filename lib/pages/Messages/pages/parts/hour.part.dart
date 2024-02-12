import 'package:flutter/material.dart';
import 'package:trive_bysc/pages/Diary/widgets/solicitud_card.dart';
import 'package:trive_bysc/pages/pages.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../Publish/widgets/time_chip.dart';


class DairyHourPart extends StatelessWidget {
  const DairyHourPart({
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Escoge una fecha',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20.h)),
                   Text('Lunes, 23 de Octubre 2023',style: TextStyle(color: primary,fontWeight: FontWeight.w500,fontSize: 18.h)),
                ],
              ),
            ),
           
            SizedBox(height: 20.h,),
            
            
            TimeChip(
              label: '09:00 AM',
            ),
            TimeChip(
              label: '09:00 AM',
            ),
            TimeChip(
              label: '09:00 AM',
            ),
            TimeChip(
              label: '09:00 AM',
            ),
          ],
        ));
  }
}
