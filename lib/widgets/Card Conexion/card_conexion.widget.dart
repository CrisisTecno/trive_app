import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trive_bysc/pages/pages.dart';
import 'package:trive_bysc/provider/provider.dart';
import 'package:trive_bysc/utils/images_network.dart';
import 'package:trive_bysc/utils/utils.dart';

class CardConexion extends StatefulWidget {
  final String nroFollowers;
  final String title;
  final String about;
  final String userId;
  const CardConexion({
    super.key,
    required this.nroFollowers,
    required this.title,
    required this.about,
    required this.userId,
  });

  @override
  State<CardConexion> createState() => _CardConexionState();
}

class _CardConexionState extends State<CardConexion> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<TriveProvider>(context, listen: false);

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        height: 290.h,
        width: 200.w,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xff0E0E0E).withOpacity(0.2)),
            borderRadius: BorderRadius.all(Radius.circular(20.h))),
        child: Column(
          children: [
            SizedBox(
              height: 130.h,
              width: 200.w,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.h))),
                    height: 80.h,
                    width: 200.w,
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      height: 100.h,
                      width: 200.w,
                      child: Row(
                        children: [
                          Spacer(),
                          SizedBox(
                            height: 100.h,
                            width: 100.h,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.w)),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'public/assets/loadings/lo3.gif',
                                image: cardConection,
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                      'public/assets/images/background_1.png'); // Ruta de la imagen por defecto
                                },
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      padding: EdgeInsets.all(6.h),
                      child: SvgPicture.asset(
                          'public/assets/icons/start_green.svg'),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.h))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    userProvider.setPersonData(widget.userId);
                    Navigator.of(context)
                        .pushNamed(RouteManager.person_profile);
                  },
                  child: Text(widget.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17.h,
                          color: Colors.black)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(widget.about,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.h,
                        color: Colors.grey)),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomLabel(
                      label: widget.nroFollowers,
                      pathSvg: 'public/assets/icons/people.svg',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 120.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.h)),
                      color: primary),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.h, vertical: 7.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Conectar',
                          style: TextStyle(
                              fontSize: 18.h,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        SvgPicture.asset(
                          'public/assets/icons/thunder_blank.svg',
                          height: 20.h,
                          width: 20.h,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
