import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../widgets/widgets.dart';
import '../../pages.dart';
import 'person_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: CustomAppBarPerson(),
              ),
              Container(
                height: 300.h,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 230.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'public/assets/images/background_1.png'),
                          fit: BoxFit
                              .cover, // Asegúrate de que la imagen cubra todo el fondo
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30.w,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(3.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        margin: EdgeInsets.only(top: 16),
                        child: CircleAvatar(
                          radius: 70.h,
                          backgroundImage:
                              AssetImage('public/assets/images/profile_1.png'),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Enrique Pablos',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 25.h)),
                        SizedBox(
                          width: 15.h,
                        ),
                        SvgPicture.asset(
                          'public/assets/icons/verificated.svg',
                          height: 38.h,
                          width: 38.h,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('Co founder de Trive ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18.h,
                            color: primary)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomLabelProfile(
                          label: '200K seguidores',
                          pathSvg: 'public/assets/icons/people.svg',
                        ),
                        CustomLabelProfile(
                          label: '+500 conexiones',
                          pathSvg: 'public/assets/icons/thunder_border.svg',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        'Programador del Tecnológico de Mty, fundador de Scaleflow Technologies, una desarrolladora de software; y de Trive, esta gran app.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.h,
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: 15.h,
                    ),
                    Wrap(spacing: 20.h, runSpacing: 2.h, children: [
                      CustomTagProfile(
                        label: '#Marketing ',
                      ),
                      CustomTagProfile(
                        label: '#Negocios ',
                      ),
                      CustomTagProfile(
                        label: '#Emprendimiento ',
                      ),
                      CustomTagProfile(
                        label: '#Startups ',
                      ),
                      CustomTagProfile(
                        label: '#Startups ',
                      ),
                      CustomTagProfile(
                        label: '#Startups ',
                      )
                    ]),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButtonProfile(
                      onClick: () {},
                      backgroundColor: primary,
                      title: 'Conectar',
                      titleColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomButtonProfile(
                      onClick: () {},
                      backgroundColor: Colors.white,
                      title: 'Suscribirme',
                      titleColor: primary,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Divider(
                      height: 2.h,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('Puedo ayudarte en',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24.h)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        'Consejería para tu empresa de tecnología, conectarte con personas que te puedan ayudar y desarrollar tu idea.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.h,
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('Mis conexiones',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24.h)),
                    SizedBox(
                      height: 20.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CardConexion(),
                          CardConexion(),
                          CardConexion(),
                          CardConexion(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
              PersonPageState()
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTagProfile extends StatelessWidget {
  final String label;
  const CustomTagProfile({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.h,
          color: Colors.black,
        ));
  }
}

class CustomLabelProfile extends StatelessWidget {
  final String label;
  final String pathSvg;
  const CustomLabelProfile({
    super.key,
    required this.label,
    required this.pathSvg,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(pathSvg),
        Text(label,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18.h,
                color: Colors.grey)),
      ],
    );
  }
}
