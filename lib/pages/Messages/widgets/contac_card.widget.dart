import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trive_bysc/utils/Size/sizer.dart';
import 'package:trive_bysc/utils/images_network.dart';
import 'package:trive_bysc/utils/theme/colors/colors.dart';

class ContactCard extends StatelessWidget {
  final String profileImageUrl;
  final Function onChanged;
  final String svgIconUrl;

  const ContactCard({
    Key? key,
    required this.profileImageUrl,
    required this.svgIconUrl,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Ajusta según tu diseño
      ),
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 1000.w,
            height: 190.h,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20.h)),
                  child: Image.network(
                    backProfile,
                    height: 120.h,
                    width: 1000.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 30,
                  bottom: 0,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 45.h,
                          backgroundImage: NetworkImage(profileImageUrl),
                        ),
                      ),
                      SizedBox(width: 10.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Carla Mendoza',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'CEO de Lorem',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'ENVÍAME UN MENSAJE PARA',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer()
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      'public/assets/icons/check.svg',
                      width: 20.h,
                    ),
                    SizedBox(width: 5.h),
                    Expanded(
                      child: Text('Ayudarte a resolver una duda o consulta'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    fillColor: primary,
                    hintText: 'Ingresa código de descuento',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (onChanged != null) {
                      onChanged();
                    }
                  },
                  child: Text('ENVIAR 20'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.h),
                      ),
                      minimumSize: Size(1000.w, 50.h)),
                ),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        print("object");
                        Navigator.of(context).pop();
                      },
                      child: Text('CERRAR'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
