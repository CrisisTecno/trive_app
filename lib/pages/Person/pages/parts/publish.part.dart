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
            SocialCard(
              name: 'Crisis',
              ocupation: 'Crisis',
              content: "xaxa",
              imageProfile:
                  "https://firebasestorage.googleapis.com/v0/b/trive-ntp.appspot.com/o/pictures%2Fp3.jpg?alt=media&token=27a456e6-c1ab-4e8a-bf2a-e05d70bcdbe6",
              imagesUrl: [
                "https://firebasestorage.googleapis.com/v0/b/trive-ntp.appspot.com/o/pictures%2Fp3.jpg?alt=media&token=27a456e6-c1ab-4e8a-bf2a-e05d70bcdbe6"
              ],
              topics: ["Finanzas"],
            ),
          ],
        ));
  }
}
