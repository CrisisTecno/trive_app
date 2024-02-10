import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trive_bysc/utils/utils.dart';

class CardNotification extends StatelessWidget {
  final String profileImageUrl;
  final String userName;
  final String actionText;
  final String timeAgo;

  const CardNotification({
    Key? key,
    required this.profileImageUrl,
    required this.userName,
    required this.actionText,
    required this.timeAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10.h),
              height: 60.h,
              width: 60.h,
              child: CircleAvatar(
                backgroundImage: NetworkImage(profileImageUrl, scale: 30.h),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: TextStyle(
                              fontSize: 20.h,
                              fontWeight: FontWeight.bold,
                            ),
                          ),SizedBox(height: 5.h),
                          Row(
                            children: [
                              SvgPicture.asset('public/assets/icons/reply.svg'),
                            SizedBox(width: 8),
                              Text(
                                actionText,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            timeAgo,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      SvgPicture.asset('public/assets/icons/points_plus_space.svg'), 
                    ],
                  ),
                  
                ],
              ),
            ),
            

          ],
        ),
        SizedBox(height: 5.h,),
        Divider(),
        SizedBox(height: 5.h,)
      ],
    );
  }
}
