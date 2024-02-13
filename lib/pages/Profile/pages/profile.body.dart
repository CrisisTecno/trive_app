import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trive_bysc/pages/Create%20Account/widgets/image_picker.widget.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../widgets/widgets.dart';
import '../../Create Account/widgets/background_picker.widget.dart';
import '../widgets/custom_buttom.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomAppBar(),
          ),
          Container(
            height: 300.h,
            child: Stack(
              children: <Widget>[
                UserBackgroundWidget(),
                Positioned(left: 30.w, bottom: 0, child: UserProfileWidget()),
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
                  children: [
                    CustomLabel(
                      label: '200K seguidores',
                      pathSvg: 'public/assets/icons/people.svg',
                    ),
                    Spacer(),
                    CustomLabel(
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
                Wrap(spacing: 5.h, runSpacing: 1.h, children: [
                  CustomTag(
                    label: '#Marketing ',
                  ),
                  CustomTag(
                    label: '#Negocios ',
                  ),
                  CustomTag(
                    label: '#Emprendimiento ',
                  ),
                  CustomTag(
                    label: '#Startups ',
                  ),
                  CustomTag(
                    label: '#Startups ',
                  ),
                  CustomTag(
                    label: '#Startups ',
                  )
                ]),
                SizedBox(
                  height: 20.h,
                ),
                CustomButtonProfile(
                  onClick: () {},
                  backgroundColor: Colors.white.withOpacity(1),
                  title: 'Editar Perfil',
                  titleColor: primary,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text('Puedo ayudarte en',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 24.h)),
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
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 24.h)),
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
        ],
      ),
    );
  }
}

class CustomTag extends StatelessWidget {
  final String label;
  const CustomTag({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13.h,
          color: Colors.black,
        ));
  }
}

class CustomLabel extends StatelessWidget {
  final String label;
  final String pathSvg;
  const CustomLabel({
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
