import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trive_bysc/utils/utils.dart';

class MeetingCard extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final String role;
  final String meetingTitle;
  final String meetingTime;
  final String meetingDate;

  const MeetingCard({
    Key? key,
    required this.profileImageUrl,
    required this.name,
    required this.role,
    required this.meetingTitle,
    required this.meetingTime,
    required this.meetingDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profileImageUrl),
                radius: 30,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(role),
                  ],
                ),
              ),
              Text(
                '1h',
                style: TextStyle(fontSize: 20.h, fontWeight: FontWeight.bold),
              ), // This should be dynamically set based on current time and event time
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Text(
                meetingTitle,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  SvgPicture.asset('public/assets/icons/clock.svg'),
                  SizedBox(width: 4),
                  Text(
                    meetingTime,
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 18.h),
                  ),
                ],
              ), // Replace with your asset name

              Row(
                children: [
                  SvgPicture.asset('public/assets/icons/date.svg'),
                  SizedBox(width: 4),
                  Text(
                    meetingDate,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 18.h),
                  ),
                ],
              ), // Replace with your asset name
            ],
          ),
          SizedBox(height: 8),
          Wrap(
            runSpacing: 15,
            spacing: 15,
            children: [
              ButtonCustom(
                label: 'Aceptar',
                pathIcon: 'public/assets/icons/check.svg',
                color: Colors.green,
              ),
              ButtonCustom(
                label: 'Rechazar',
                pathIcon: 'public/assets/icons/close.svg',
                color: Colors.red,
              ),
              ButtonCustom(
                label: 'Reply',
                pathIcon: 'public/assets/icons/reply.svg',
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonCustom extends StatelessWidget {
  final String label;
  final String pathIcon;
  final Color color;
  const ButtonCustom({
    super.key,
    required this.label,
    required this.pathIcon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 28.h,
        width: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: color.withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label),
            SizedBox(
              width: 2.h,
            ),
            SvgPicture.asset(pathIcon),
          ],
        ),
      ),
    );
  }
}
