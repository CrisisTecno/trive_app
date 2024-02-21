import 'package:flutter/material.dart';
import 'package:trive_bysc/pages/Diary/widgets/caendar.widget.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../../widgets/widgets.dart';

class PublishPartSelect extends StatelessWidget {
  const PublishPartSelect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 7.h, top: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SocialCard(),
          ],
        ));
  }
}
