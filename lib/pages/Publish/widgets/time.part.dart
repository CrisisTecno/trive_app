import 'package:flutter/material.dart';
import 'package:trive_bysc/utils/utils.dart';

import 'time_chip.dart';


class TimePartSelect extends StatelessWidget {
  const TimePartSelect({
    super.key,
  });

  @override
    Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 7.h, top: 25.h),
        child: Column(
          children: [
            TimeChip(
              label: '30 minutos',
            ),
            TimeChip(
              label: '1 hora',
            ),
            TimeChip(
              label: '1:30 Horas',
            ),
            TimeChip(
              label: '2:00 Horas',
            ),
          ],
        ));
  }}
