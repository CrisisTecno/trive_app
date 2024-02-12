import 'package:flutter/material.dart';
import 'package:trive_bysc/pages/Diary/widgets/solicitud_card.dart';
import 'package:trive_bysc/pages/pages.dart';
import 'package:trive_bysc/utils/utils.dart';

import 'time_chip.dart';

class HourPart extends StatelessWidget {
  const HourPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 7.h, top: 25.h),
        child: Column(
          children: [
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
