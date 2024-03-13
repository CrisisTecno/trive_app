import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trive_bysc/pages/Create%20Account/widgets/image_picker.widget.dart';
import 'package:trive_bysc/pages/Profile/pages/EditProfile/edit_profile_1.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../widgets/widgets.dart';
import '../../Create Account/widgets/background_picker.widget.dart';
import '../widgets/custom_buttom.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Future<DocumentSnapshot> _userData;

  @override
  void initState() {
    super.initState();
    _userData = _fetchUserData();
  }

  Future<DocumentSnapshot> _fetchUserData() async {
    String userId = '2km2fk2K5dV8oqHhutw4';
    return FirebaseFirestore.instance.collection('Users').doc(userId).get();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: FutureBuilder<DocumentSnapshot>(
        future: _userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          }
          // Aquí se obtienen los datos del usuario
          final userData = snapshot.data!.data() as Map<String, dynamic>;

          return Column(
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
                    Positioned(
                        left: 30.w, bottom: 0, child: UserProfileWidget()),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Aquí puedes utilizar los datos del usuario
                    Text(
                      userData['name'],
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 25.h),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      userData['occupation'],
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.h,
                          color: primary),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        CustomLabel(
                          label: userData['followers'].length.toString() +
                              ' seguidores',
                          pathSvg: 'public/assets/icons/people.svg',
                        ),
                        Spacer(),
                        CustomLabel(
                          label: userData['followers'].length.toString() +
                              ' conexiones',
                          pathSvg: 'public/assets/icons/thunder_border.svg',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(userData['about'],
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.h,
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: 15.h,
                    ),
                    Wrap(
                      spacing: 5.h,
                      runSpacing: 1.h,
                      children: List<Widget>.from(
                          (userData['topics'] as List<dynamic>).map((topic) {
                        return CustomTag(label: '#' + topic.toString());
                      })),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButtonProfile(
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditProfile1(
                              userId: '2km2fk2K5dV8oqHhutw4',
                            ),
                          ),
                        );
                      },
                      backgroundColor: Colors.white.withOpacity(1),
                      title: 'Editar Perfil',
                      titleColor: primary,
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
                    Text(userData['help'],
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
            ],
          );
        },
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
