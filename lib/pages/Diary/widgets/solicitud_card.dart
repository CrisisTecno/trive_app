import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trive_bysc/pages/Diary/widgets/custom_buttom_solicitud.widget.dart';
import 'package:trive_bysc/utils/utils.dart';

class SolicitudCard extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final String role;
  final String meetingTime;

  const SolicitudCard({
    Key? key,
    required this.profileImageUrl,
    required this.name,
    required this.role,
    required this.meetingTime,
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
              ), 
            ],
          ),
          
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('public/assets/icons/clock.svg'),
                  SizedBox(width: 4),
                  Text(
                    meetingTime,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 18.h),
                  ),
                ],
              ), 

             
            ],
          ),
          SizedBox(height: 8),
          Wrap(
            runSpacing: 15,
            spacing: 15,
            children: [
              ButtonCustomSolicitud(
                label: 'Aceptar',
                pathIcon: 'public/assets/icons/check.svg',
                color: Colors.green,
              ),
              ButtonCustomSolicitud(
                label: 'Rechazar',
                pathIcon: 'public/assets/icons/close.svg',
                color: Colors.red,
              ),
              ButtonCustomSolicitud(
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
