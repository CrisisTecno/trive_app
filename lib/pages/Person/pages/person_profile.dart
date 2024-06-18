import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trive_bysc/pages/Person/pages/chip.widget.dart';
import 'package:trive_bysc/provider/provider.dart';
import 'package:trive_bysc/utils/utils.dart';

import '../../../widgets/widgets.dart';
import '../../pages.dart';
import 'person_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<DocumentSnapshot> _userData;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userData = _fetchPersonData();
  }

  Future<DocumentSnapshot> _fetchPersonData() async {
    final userProvider = Provider.of<TriveProvider>(context);
    final userId = userProvider.personId;
    return FirebaseFirestore.instance.collection('Users').doc(userId).get();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: FutureBuilder<DocumentSnapshot>(
            future: _userData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Ocurrio un error'),
                );
              }
              if (!snapshot.hasData) {
                return Center(
                  child: Text("No se encontraron los datos"),
                );
              }

              final userData = snapshot.data!.data() as Map<String, dynamic>;
              print(userData);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: CustomAppBarPerson(),
                  ),
                  Container(
                    height: 250.h,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            height: 230.h,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.h)),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'public/assets/loadings/lo3.gif',
                                image: userData['secondImage'],
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                      'public/assets/images/background_1.png'); // Ruta de la imagen por defecto
                                },
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30.w,
                          bottom: 0,
                          child: Container(
                            width: 150.h,
                            height: 150.h,
                            padding: EdgeInsets.all(3.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            margin: EdgeInsets.only(top: 16),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.h)),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'public/assets/loadings/lo3.gif',
                                image: userData['mainImage'],
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                      'public/assets/images/background_1.png'); // Ruta de la imagen por defecto
                                },
                              ),
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
                            Text(userData['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25.h)),
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
                        Text(userData['occupation'],
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
                              label: userData['followers'].length.toString() +
                                  ' seguidores',
                              pathSvg: 'public/assets/icons/people.svg',
                            ),
                            CustomLabelProfile(
                              label: userData['followers'].length.toString() +
                                  ' seguidores',
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
                              (userData['topics'] as List<dynamic>)
                                  .map((topic) {
                            return CustomTag(label: '#' + topic.toString());
                          })),
                        ),
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
                        Text(userData['help'],
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18.h,
                              color: Colors.black,
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('Conexiones de ' + userData['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 24.h)),
                        SizedBox(
                          height: 20.h,
                        ),
                        //aca cambio de las conexiones
                        CarruselSocial1(),

                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                  PersonPageState()
                ],
              );
            },
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
