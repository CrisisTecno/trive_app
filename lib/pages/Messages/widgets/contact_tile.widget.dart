import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trive_bysc/utils/utils.dart';

class ContactTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String position;

  const ContactTile({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 10.h),
      color: primary, // Ajusta el color según el diseño
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 30, // Ajusta según el tamaño deseado
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  position,
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SvgPicture.asset(
                'public/assets/icons/video.svg',
                height: 40.h,
                width: 40.h,
              ),
              SizedBox(width: 3.h),
              Text('Agendar',style: TextStyle(fontSize: 15.h,color: Colors.white),)
            ],
          )
        ],
      ),
    );
  }
}
