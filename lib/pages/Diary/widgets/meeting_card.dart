import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trive_bysc/utils/utils.dart';

class MeetingCard extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final String role;
  final String id;
  final String meetingTitle;
  final String meetingTime;
  final String meetingDate;
  final String status;

  const MeetingCard({
    Key? key,
    required this.profileImageUrl,
    required this.name,
    required this.role,
    required this.meetingTitle,
    required this.meetingTime,
    required this.meetingDate,
    required this.id,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(id);
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
              // This should be dynamically set based on current time and event time
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
          status == "FOR_CONFIRMATION"
              ? Wrap(
                  runSpacing: 15,
                  spacing: 15,
                  children: [
                    ButtonCustom(
                      onTap: () async {
                        try {
                          await FirebaseFirestore.instance
                              .collection('Calls')
                              .doc(id)
                              .update({'status': 'ACEPTED'});
                          print('Document $id successfully updated.');
                        } catch (e) {
                          print('Error updating document: $e');
                          // Manejar el error según sea necesario
                        }
                      },
                      label: 'Aceptar',
                      pathIcon: 'public/assets/icons/check.svg',
                      color: Colors.green,
                    ),
                    ButtonCustom(
                      onTap: () async {
                        try {
                          print(id);
                          await FirebaseFirestore.instance
                              .collection('Calls')
                              .doc(id)
                              .update({'status': 'CANCELED'});
                          print('Document $id successfully updated.');
                        } catch (e) {
                          print('Error updating document: $e');
                          // Manejar el error según sea necesario
                        }
                      },
                      label: 'Rechazar',
                      pathIcon: 'public/assets/icons/close.svg',
                      color: Colors.red,
                    ),
                  ],
                )
              : SizedBox(
                  child: status == "ACEPTED"
                      ? Center(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Text(
                                'REUNION ACEPTADA',
                                style: TextStyle(),
                              )),
                        )
                      : Center(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Text(
                                'REUNION RECHAZADA',
                                style: TextStyle(),
                              )),
                        ))
        ],
      ),
    );
  }
}

class ButtonCustom extends StatelessWidget {
  final String label;
  final String pathIcon;
  final Color color;
  final VoidCallback onTap;
  const ButtonCustom({
    super.key,
    required this.label,
    required this.pathIcon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
